// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:get/instance_manager.dart';

import 'package:harmonix/musicmain.dart/bottomnavbar.dart';
import 'package:harmonix/screens/login.dart';
import 'package:harmonix/screens/loginpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(SignUpController());
   
    return SingleChildScrollView(
      child: Container(
          width: 408,
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
                    width: 25,
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
                        
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: 'Enter your name',
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
                              color:
                                  const Color.fromARGB(255, 197, 141, 56))),
                      child: TextFormField(
                        
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
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
                              color:
                                  const Color.fromARGB(255, 197, 141, 56))),
                      child: TextFormField(
                        obscureText: true,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            // prefixIcon: IconButton(
                            //   icon: Icon(
                            //     _passwordVisible
                            //         ? Icons.visibility
                            //         : Icons.visibility_off,
                            //   ),
                            //   onPressed: () {
                            //    setState (() {
                            //      _passwordVisible = !_passwordVisible;
                            //     });
                            //   },
                            // ),
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
                      child: GestureDetector(
                        
                        onTap: () {
                         
                        },
                        child: Text(
                          "Sign Up",
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
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "--------- OR ---------",
                    style:
                        TextStyle(fontSize: 23, fontFamily: "Merriweather"),
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
                    style:
                        TextStyle(fontSize: 18, fontFamily: "Merriweather"),
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
                    width: 70,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogPage()));
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
          )),
    );
  }
}
