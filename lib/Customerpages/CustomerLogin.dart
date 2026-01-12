import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobowiza/Customerpages/customerAccount.dart';
// import 'profile_page.dart'; 

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign in to your account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      _SocialButton(
                        text: 'Sign in with Google',
                        iconWidget: Image.asset('assets/icon/google.png', height: 24),
                        onPressed: () async {
                          try {
                            // Version 7.2.0 uses the .instance singleton
                            final googleSignIn = GoogleSignIn.instance;
                            
                            // You MUST initialize before using
                            await googleSignIn.initialize();

                            // Use authenticate() instead of signIn()
                            final user = await googleSignIn.authenticate();
                            
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
                              );
                            }
                          } catch (error) {
                            debugPrint("Login Error: $error");
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      _SocialButton(
                        text: 'Sign in with Facebook',
                        iconWidget: const Icon(Icons.facebook, color: Colors.blue, size: 28),
                        onPressed: () {},
                      ),
                      // const SizedBox(height: 32),
                      // const _OrDivider(),
                      // ... rest of your email textfields ...
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Helper classes included to fix your "undefined" errors ---
class _SocialButton extends StatelessWidget {
  final String text;
  final Widget iconWidget;
  final VoidCallback onPressed;
  const _SocialButton({required this.text, required this.iconWidget, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey.shade300)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [iconWidget, const SizedBox(width: 12), Text(text)],
        ),
      ),
    );
  }
}

// class _OrDivider extends StatelessWidget {
//   const _OrDivider();
//   @override
//   Widget build(BuildContext context) {
//     return const Row(children: [
//       Expanded(child: Divider()),
//       Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text("OR")),
//       Expanded(child: Divider()),
//     ]);
//   }
// }