import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/naturewallpaper.jpg', // Replace with your logo asset path
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'HarmoniX',
              style: TextStyle(
                fontFamily: "DancingScript",
                fontSize: 48,
                color: Color.fromARGB(255, 218, 207, 187),
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 218, 207, 187),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
