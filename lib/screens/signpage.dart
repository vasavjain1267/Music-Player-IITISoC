import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harmonix/musicmain.dart/bottomnavbar.dart';
import 'package:harmonix/screens/signup.dart';
import 'package:harmonix/screens/welcome.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Welcome()));
            },
            child: Icon(
              Icons.arrow_back_outlined,
              size: 40,
              color: Color.fromARGB(255, 214, 148, 6),
            )),
      ),
      body: SignUp(),
    );
  }
}
