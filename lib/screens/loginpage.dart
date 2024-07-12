// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:harmonix/musicmain/bottomnavbar.dart';
import 'package:harmonix/screens/Reset.dart';
import 'package:harmonix/screens/signpage.dart';
import 'package:harmonix/screens/welcome.dart';
import 'package:harmonix/services/authservice.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  // String email = "", password = "";

  // TextEditingController mailcontroller = new TextEditingController();
  // TextEditingController passwordcontroller = new TextEditingController();

  // final _formkey = GlobalKey<FormState>();

  // userLogin() async {
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => bottomnav()));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orangeAccent,
  //           content: Text(
  //             "No User Found for that Email",
  //             style: TextStyle(fontSize: 18.0),
  //           )));
  //     } else if (e.code == 'wrong-password') {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.orangeAccent,
  //           content: Text(
  //             "Wrong Password Provided by User",
  //             style: TextStyle(fontSize: 18.0),
  //           )));
  //     }
  //   }
  // }
  String email = "", password = "";
  bool _passwordVisible = false;
  bool _isLoading = false;

  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Future<void> userLogin() async {
    if (passwordcontroller.text.isNotEmpty && mailcontroller.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      // setState(() {
      //   _isLoading = true;
      // });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        // Fetch user details from Firestore
        // DocumentSnapshot docSnap = await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(userCredential.user!.uid)
        //     .get();

        // if (docSnap.exists) {
        //   Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;
        //   String name = data['name'];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => bottomnav()),
        );
        // } else {
        //   // Handle case where document doesn't exist
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     backgroundColor: Colors.orangeAccent,
        //     content: Text(
        //       "No user found associated with this email.",
        //       style: TextStyle(fontSize: 18.0),
        //     ),
        //   ));
        // }
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = "No User Found for that Email";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Wrong Password Provided by User";
        } else {
          errorMessage = "An error occurred. Please try again.";
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            errorMessage,
            style: TextStyle(fontSize: 18.0),
          ),
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
              width: 408,
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
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: 25,
                    //     ),
                    //     Text(
                    //       "Name",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 20,
                    //           fontFamily: "Merriweather"),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 4,
                    // ),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: 23,
                    //     ),
                    //     Container(
                    //         width: 320,
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //             borderRadius:
                    //                 BorderRadius
                    //                     .circular(40),
                    //             border: Border.all(
                    //                 color: const Color
                    //                     .fromARGB(
                    //                     255,
                    //                     197,
                    //                     141,
                    //                     56))),
                    //         child: TextFormField(
                    //           decoration:
                    //               InputDecoration(
                    //                   border:
                    //                       InputBorder
                    //                           .none),
                    //         ))
                    //   ],
                    // ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
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
                          width: 23,
                        ),
                        Container(
                            width: 320,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 197, 141, 56))),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter E-mail';
                                }
                                return null;
                              },
                              controller: mailcontroller,
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
                          width: 25,
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
                          width: 23,
                        ),
                        Container(
                            width: 320,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 197, 141, 56))),
                            child: TextFormField(
                              controller: passwordcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              //controller: password,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              // obscureText: true,
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
                                      //fontFamily: "Merriweather",
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
                          width: 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                email = mailcontroller.text;
                                password = passwordcontroller.text;
                              });
                            }
                            userLogin();
                          },
                          child: Container(
                            width: 280,
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
                          width: 120,
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
                          width: 45,
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
                          width: 150,
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
                            // color: Colors.white,
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
                          width: 130,
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
}
