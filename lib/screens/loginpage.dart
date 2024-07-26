import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:harmonix/musicmain/bottomnavbar.dart';
import 'package:harmonix/screens/Reset.dart';
import 'package:harmonix/screens/signpage.dart';
import 'package:harmonix/screens/welcome.dart';
import 'package:harmonix/settings/setting_page.dart';
// import 'package:harmonix/settings/settings_page.dart'; // Import the settings page
import 'package:harmonix/services/authservice.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _passwordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              child: Icon(
                Icons.arrow_back_outlined,
                size: 40,
                color: Color.fromARGB(255, 214, 148, 5),
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome back",
                      style: TextStyle(
                          fontFamily: "DancingScript",
                          fontSize: 52,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Merriweather"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.35,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 197, 141, 56))),
                            child: TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter E-mail';
                                }
                                return null;
                              },
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.mail),
                                  border: InputBorder.none,
                                  hintText: "Enter your email",
                                  hintStyle: TextStyle(
                                      fontSize: 21,
                                      color:
                                          Color.fromARGB(66, 218, 212, 212))),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Merriweather"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.35,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 197, 141, 56))),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xFFb2b7bf),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  hintText: 'Enter your Password',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(66, 218, 212, 212),
                                      fontSize: 21)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                        ),
                        GestureDetector(
                          onTap: _login,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 177, 113, 40),
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 212, 164, 101),
                                  Color.fromARGB(255, 219, 135, 24)
                                ])),
                            child: Center(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 238, 237, 235),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Merriweather"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reset()));
                          },
                          child: Text(
                            "Forget password?",
                            style: TextStyle(
                                fontFamily: "Default",
                                fontSize: 18,
                                color: const Color.fromARGB(255, 231, 183, 10)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 9,
                        ),
                        Text(
                          "--------- OR ---------",
                          style: TextStyle(
                              fontSize: 23, fontFamily: "Merriweather"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.7,
                        ),
                        Text(
                          "Sign in with",
                          style: TextStyle(
                              fontSize: 18, fontFamily: "Merriweather"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 85),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 212, 164, 101),
                                Color.fromARGB(255, 219, 135, 24)
                              ])),
                          child: AnyLogo.media.facebook.image(),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            AuthMethods().signInWithGoogle(context);
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 212, 164, 101),
                                  Color.fromARGB(255, 219, 135, 24)
                                ])),
                            child: AnyLogo.media.gmail.image(),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 212, 164, 101),
                                Color.fromARGB(255, 219, 135, 24)
                              ])),
                          child: AnyLogo.media.instagram.image(),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.2,
                        ),
                        Text(
                          "First time? ",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Merriweather",
                              fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignPage()));
                          },
                          child: Text(
                            " Sign up",
                            style: TextStyle(
                              color: Color.fromARGB(255, 218, 101, 7),
                              fontFamily: "Merriweather",
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Fetch user data from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        if (userDoc.exists) {
          String username = userDoc['username'];
          String email = userDoc['email'];

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsPage(
                username: username,
                email: email,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User data not found')),
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message!)),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
