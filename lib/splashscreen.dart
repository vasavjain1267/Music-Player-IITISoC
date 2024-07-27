import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmonix/musicmain/bottomnavbar.dart';
import 'package:harmonix/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() async {
    await Future.delayed(Duration(seconds: 2));  // Simulate a loading time
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.pushReplacementNamed(context, '/welcome');
    } else {
      // Retrieve additional user information if necessary
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final String username = userDoc['name'] ?? 'User';
      final String email = user.email ?? '';

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => bottomnav(username: username, email: email),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),  // Add your splash screen content here
      ),
    );
  }
}
