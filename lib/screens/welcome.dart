// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

//import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:harmonix/screens/login.dart';
import 'package:harmonix/screens/signup.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 370,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.8,
                        image: AssetImage(
                          "assets/musichome.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                bottom: -100,
                left: -180,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 131, 107, 43),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 156, 116, 55),
                            spreadRadius: 15,
                            blurRadius: 10)
                      ]),
                )),
            Positioned(
                bottom: -370,
                left: 150,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 70, 67, 64),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Color.fromARGB(255, 156, 116, 55),
                    //       spreadRadius: 15,
                    //       blurRadius: 10)
                    // ]
                  ),
                )),
            Positioned(
                bottom: -270,
                left: 120,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 70, 67, 64),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Color.fromARGB(255, 156, 116, 55),
                    //       spreadRadius: 15,
                    //       blurRadius: 10)
                    // ]
                  ),
                )),
          ]),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 70, 67, 64),
              // boxShadow: [
              //   BoxShadow(
              //       color: Color.fromARGB(255, 70, 65, 64),
              //       spreadRadius: 15,
              //       blurRadius: 10)
              // ]
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 15,
                    left: 90,
                    width: double.maxFinite,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText("HarmoniX",
                            textStyle: TextStyle(
                              fontFamily: "DancingScript",
                              fontSize: 54,
                              color: Color.fromARGB(255, 218, 207, 187),
                            ),
                            speed: Duration(milliseconds: 300))
                      ],
                      totalRepeatCount: 15,
                      pause: Duration(milliseconds: 20),
                      stopPauseOnTap: true,
                      displayFullTextOnTap: true,
                    )),
                Positioned(
                    bottom: -60,
                    left: -160,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 131, 107, 43),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 156, 116, 55),
                                spreadRadius: 15,
                                blurRadius: 10)
                          ]),
                    )),
                Positioned(
                    bottom: 140,
                    right: -160,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 131, 107, 43),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 156, 116, 55),
                                spreadRadius: 15,
                                blurRadius: 10)
                          ]),
                    )),
                Positioned(
                    top: -100,
                    left: -180,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 131, 107, 43),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 156, 116, 55),
                                spreadRadius: 15,
                                blurRadius: 10)
                          ]),
                    )),
                Positioned(
                    top: 115,
                    left: 35,
                    //width: double.maxFinite,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                            "From quiet whispers to vibrant beats,\nFind your rhythm, a symphony that meets\nEvery mood, every heart's desire\nMusic's magic, set your soul on fire.",
                            textStyle: TextStyle(
                              fontFamily: "DancingScript",
                              fontSize: 24,
                              color: Color.fromARGB(255, 187, 156, 99),
                            ),
                            speed: Duration(milliseconds: 100))
                      ],
                      totalRepeatCount: 15,
                      pause: Duration(milliseconds: 20),
                      stopPauseOnTap: true,
                      displayFullTextOnTap: true,
                    )),
                Positioned(
                    top: 320,
                    left: 70,
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
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor:
                                      Color.fromARGB(255, 70, 67, 64),
                                  scrollControlDisabledMaxHeightRatio: 9,
                                  context: context,
                                  builder: (context) {
                                    return LogIn();
                                  });
                            },
                            child: Text(
                              "LogIn",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "default"),
                            ),
                          ),
                        ))),
                Positioned(
                    top: 375,
                    left: 70,
                    child: Container(
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 231, 163, 61)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  scrollControlDisabledMaxHeightRatio: 9,
                                  backgroundColor:
                                      Color.fromARGB(255, 70, 67, 64),
                                  context: context,
                                  builder: (context) {
                                    return SignUp();
                                  });
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 231, 152, 6),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "default"),
                            ),
                          ),
                        )))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
