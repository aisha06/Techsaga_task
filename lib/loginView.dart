// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'authservice.dart';
//
// class LoginView extends StatelessWidget {
//   final AuthService _authService = AuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Welcome',
//               style: TextStyle(
//                 fontSize: 32.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'Sign in to continue',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.white70,
//               ),
//             ),
//             SizedBox(height: 50.0),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 onPrimary: Colors.black,
//                 minimumSize: Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               icon: Icon(Icons.login),
//               label: Text(
//                 'Sign in with Google',
//                 style: TextStyle(fontSize: 18),
//               ),
//               onPressed: () async {
//                 User? user = await _authService.signInWithGoogle();
//                 if (user != null) {
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                         content: Text('Sign-in failed. Please try again.')),
//                   );
//                 }
//               },
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'By signing in, you agree to our terms and conditions.',
//               style: TextStyle(color: Colors.white70),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
