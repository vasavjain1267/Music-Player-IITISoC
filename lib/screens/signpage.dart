import 'package:flutter/material.dart';
import 'package:harmonix/screens/signup.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                size: 40,
                color: Color.fromARGB(255, 214, 148, 3),
              )),
        ),
        body: SignUp(),
      ),
    );
  }
}
