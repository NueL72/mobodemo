// import 'package:flutter/material.dart';
// // import 'package:mobowiza/Customerpages/custome_firstPg.dart';
// import 'package:mobowiza/Customerpages/customerAccount.dart';
// import 'auth_service.dart'; // Import the service created above

// class LoginPage extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Google Login")),
//       body: Center(
//         child: ElevatedButton.icon(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white,
//             foregroundColor: Colors.black,
//             minimumSize: Size(250, 50),
//           ),
//           icon: Icon(Icons.login, color: Colors.red), 
//           label: Text("Sign in with Google"),
//           onPressed: () async {
//             final user = await _authService.signInWithGoogle();
//             if (user != null) {
//               print("Signed in: ${user.user?.displayName}");
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfilePage()),
//               );
//               // Navigate to your Home Screen here
//             }
//           },
//         ),
//       ),
//     );
//   }
// }