// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:harmonix/screens/Reset.dart';
import 'package:harmonix/screens/signpage.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: 408,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
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
                              color: const Color.fromARGB(255, 197, 141, 56))),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                                //fontFamily: "Merriweather",
                                color: Color.fromARGB(66, 218, 212, 212),
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
                              color: const Color.fromARGB(255, 197, 141, 56))),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
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
                    width: 52,
                  ),
                  Container(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Reset()));
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
                    style: TextStyle(fontSize: 23, fontFamily: "Merriweather"),
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
                    style: TextStyle(fontSize: 18, fontFamily: "Merriweather"),
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
                    // color: Colors.white,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignPage()));
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
          )),
    );
  }
}
