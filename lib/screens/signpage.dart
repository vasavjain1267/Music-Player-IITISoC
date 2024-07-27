import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:harmonix/musicmain/bottomnavbar.dart';
import 'package:harmonix/screens/loginpage.dart';
import 'package:harmonix/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool _isLoading = false;
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        User? user = userCredential.user;

        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'name': _nameController.text,
            'email': _emailController.text,
          });
        }

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => bottomnav(
                      username: _nameController.text,
                      email: _emailController.text,
                    )));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message ?? 'Registration failed'),
        ));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text("Wait For Few Seconds"),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Get Started",
                          style: TextStyle(
                              fontFamily: "DancingScript",
                              fontSize: 52,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
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
                              "Name",
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
                                  controller: _nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Name';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      border: InputBorder.none,
                                      hintText: 'Enter your name',
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(66, 218, 212, 212),
                                          fontSize: 21)),
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
                                      return 'Please Enter Email';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail),
                                      border: InputBorder.none,
                                      hintText: 'Enter your email',
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(66, 218, 212, 212),
                                          fontSize: 21)),
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
                                  obscureText: !_passwordVisible,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
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
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(66, 218, 212, 212),
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
                              width: MediaQuery.of(context).size.width / 7.2,
                            ),
                            Container(
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
                                child: GestureDetector(
                                  onTap: _register,
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 238, 237, 235),
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
                          height: 25,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 8,
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
                            Container(
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
                              width: MediaQuery.of(context).size.width / 7,
                            ),
                            Text(
                              "Already have an account? ",
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
                                        builder: (context) => LogPage()));
                              },
                              child: Text(
                                " Log In",
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
    );
  }
}
