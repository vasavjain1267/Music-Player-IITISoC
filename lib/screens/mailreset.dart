import 'package:flutter/material.dart';

class Mailreset extends StatefulWidget {
  const Mailreset({super.key});

  @override
  State<Mailreset> createState() => _MailresetState();
}

class _MailresetState extends State<Mailreset> {
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
                "Mail Recovery",
                style: TextStyle(
                    fontFamily: "DancingScript",
                    fontSize: 32,
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
                    " Mail",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Merriweather"),
                  )
                ],
              ),
              SizedBox(
                height: 10,
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
                height: 20,
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
                        "Send Mail",
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 237, 235),
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Merriweather"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 280,
              )
            ],
          )),
    );
  }
}
