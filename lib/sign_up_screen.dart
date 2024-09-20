// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart'; // Facebook Auth package

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   // Google Sign-Up Function
//   Future<User?> _signUpWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) return null; // The user canceled the sign-in

//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       final UserCredential userCredential = await _auth.signInWithCredential(credential);
//       return userCredential.user;
//     } catch (e) {
//       print("Error signing up with Google: $e");
//       return null;
//     }
//   }

//   // Facebook Sign-Up Function
//   Future<User?> _signUpWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
//         final UserCredential userCredential = await _auth.signInWithCredential(credential);
//         return userCredential.user;
//       }
//       return null; // Login failed
//     } catch (e) {
//       print("Error signing up with Facebook: $e");
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Google Sign-In Button
//             ElevatedButton(
//               onPressed: () async {
//                 User? user = await _signUpWithGoogle();
//                 if (user != null) {
//                   Navigator.pushReplacementNamed(context, '/home');
//                 }
//               },
//               child: Text('Sign up with Google'),
//             ),
//             SizedBox(height: 20),
//             // Facebook Sign-In Button
//             ElevatedButton(
//               onPressed: () async {
//                 User? user = await _signUpWithFacebook();
//                 if (user != null) {
//                   Navigator.pushReplacementNamed(context, '/home');
//                 }
//               },
//               child: Text('Sign up with Facebook'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
