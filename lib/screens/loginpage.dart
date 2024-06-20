// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:harmonix/screens/signpage.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
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
                color: Color.fromARGB(255, 214, 148, 4),
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
              width: 408,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome back",
                    style: TextStyle(
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
                  //           fontFamily: "Tourney"),
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
                            fontFamily: "Tourney"),
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
                                  color:
                                      const Color.fromARGB(255, 197, 141, 56))),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 110, 105, 105))),
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
                            fontFamily: "Tourney"),
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
                                  color:
                                      const Color.fromARGB(255, 197, 141, 56))),
                          child: TextFormField(
                            //controller: password,
                            textAlign: TextAlign.center,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    //fontFamily: "Tourney",
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
                                fontFamily: "Tourney"),
                          ),
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
                        "------------------- OR --------------------",
                        style: TextStyle(fontSize: 23, fontFamily: "Tourney"),
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
                        style: TextStyle(fontSize: 18, fontFamily: "Tourney"),
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
                            fontFamily: "Tourney",
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
                            fontFamily: "Tourney",
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
        ),
      ),
    );
  }
}
