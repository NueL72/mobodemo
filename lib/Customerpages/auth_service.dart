import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // 1. Initialize with your Web Client ID
      await _googleSignIn.initialize(
        serverClientId: '679921037252-fmucjc6eiepg9s0r1anubu4cfdl4gaeu.apps.googleusercontent.com',
      );

      // 2. SIGN IN: Added a scope hint to ensure the handshake starts correctly
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email', 'openid'], 
      );

      if (googleUser == null) return null;

      // 3. GET AUTHENTICATION (for idToken)
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 4. FIX: GET AUTHORIZATION (for accessToken)
      // The error in your log happened here because of the empty [] list.
      // We must request 'email' or 'openid' to get a valid access token.
      final GoogleSignInClientAuthorization authStatus = 
          await googleUser.authorizationClient.authorizeScopes(['email', 'openid']);

      // 5. CREATE CREDENTIAL
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authStatus.accessToken, 
        idToken: googleAuth.idToken,         
      );

      // 6. FIREBASE SIGN IN
      print("🔗 Exchanging tokens with Firebase...");
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      
      print("✅ SUCCESS: User ${userCredential.user?.email} is now in Firebase!");
      return userCredential;

    } catch (e) {
      // This will now catch and print the real reason if it still fails
      print("❌ GOOGLE AUTH ERROR: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}