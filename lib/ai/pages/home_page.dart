// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:ask_me/bloc/chatbloc_bloc.dart';
// import 'package:ask_me/models/chatmessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmonix/ai/bloc/chatbloc_bloc.dart';
import 'package:harmonix/ai/models/chatmessage.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatblocBloc chatbloc = ChatblocBloc();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatblocBloc, ChatblocState>(
        bloc: chatbloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<Chatmessage> messages = (state as ChatSuccessState).messages;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.3,
                        image: AssetImage(
                          "assets/wallpaper.jpeg",
                        ),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Music AI",
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 18, 170, 23)),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                          Colors.cyanAccent.withOpacity(0.1)),
                                  child: Column(
                                    children: [
                                      Text(
                                        messages[index].role == "user"
                                            ? "user"
                                            : "AI",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                messages[index].role == "user"
                                                    ? Color.fromARGB(
                                                        255, 135, 13, 165)
                                                    : const Color.fromARGB(
                                                        255, 182, 164, 5)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        messages[index].parts.first.text,
                                        style: TextStyle(height: 1.2),
                                      ),
                                    ],
                                  ));
                            })),
                    if (chatbloc.generating)
                      Container(
                          height: 80,
                          width: 80,
                          child: Lottie.asset("assets/ailoader.json")),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      // height: 80,
                      // color: Colors.lightGreen,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: textEditingController,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                                hintText: "Ask me about music",
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.amberAccent.shade200),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(50)),
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.cyanAccent),
                                    borderRadius: BorderRadius.circular(50))),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatbloc.add(ChatGenerateNewTextMessageEvent(
                                    inputMessage: text));
                              }
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.amberAccent,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor:
                                    Color.fromARGB(255, 224, 125, 200),
                                child: Center(
                                  child: Icon(
                                    Icons.send_sharp,
                                    size: 40,
                                    color: Color.fromARGB(255, 62, 77, 211),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
