// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:harmonix/screens/mailreset.dart';
import 'package:harmonix/screens/otpreset.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
              child: Column(
                children: [
                  Icon(
                    Icons.restore,
                    size: 270,
                    color: Color.fromARGB(255, 122, 93, 4),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Reset",
                    style: TextStyle(
                        fontFamily: "DancingScript",
                        fontSize: 52,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                     onTap: () {
                      showModalBottomSheet(
                          scrollControlDisabledMaxHeightRatio: 9,
                          backgroundColor: Color.fromARGB(255, 70, 67, 64),
                          context: context,
                          builder: (context) {
                            return Mailreset();
                          });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(206, 53, 46, 46),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.mail,
                                size: 85,
                                color: const Color.fromARGB(255, 126, 99, 4),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mail",
                                    style: TextStyle(fontSize: 23),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Reset via mail verification",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          scrollControlDisabledMaxHeightRatio: 9,
                          backgroundColor: Color.fromARGB(255, 70, 67, 64),
                          context: context,
                          builder: (context) {
                            return Otpreset();
                          });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(206, 53, 46, 46),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 85,
                                color: const Color.fromARGB(255, 126, 99, 4),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone",
                                    style: TextStyle(fontSize: 23),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Reset via O.T.P verification",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
