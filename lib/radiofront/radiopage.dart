// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonix/radiofront/radio.dart';
import 'package:harmonix/radiofront/radiotile.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:radio_player/radio_player.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  List<RadioModel>? radioList;

  RadioModel? currentPlayingRadio;
  RadioPlayer radioPlayer = RadioPlayer();
  bool get isRadioPlaying => currentPlayingRadio != null;
  bool isPlaying = false;
  @override
  void initState() {
    radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });
    get(Uri.parse("http://10.0.2.2:8000/radios")).then((response) {
      List data = jsonDecode(response.body);
      radioList = data.map((e) => RadioModel.fromJson(e)).toList();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Radio",
          style: TextStyle(
              fontSize: 50,
              fontFamily: "DancingScript",
              color: Color.fromARGB(255, 184, 145, 5)),
        )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          if (isRadioPlaying) ...[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  currentPlayingRadio!.image ?? "",
                  width: 370,
                  height: 280,
                  fit: BoxFit.cover,
                  errorBuilder: (context, obj, _) => Container(
                    color: Color.fromARGB(66, 185, 182, 4),
                    height: 280,
                    width: 370,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                currentPlayingRadio!.title ?? "No title available",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
                child: Align(
              alignment: Alignment.center,
              child: Text(
                currentPlayingRadio!.subtitle ?? "No information available",
                style: TextStyle(fontSize: 18, color: Colors.lightGreenAccent),
                maxLines: 2,
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 70,
                ),
                Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Color.fromARGB(255, 206, 161, 1),
                  size: 40,
                ),
                SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    if (isPlaying) {
                      radioPlayer.pause();
                    } else {
                      radioPlayer.play();
                    }
                  },
                  child: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Color.fromARGB(255, 206, 161, 1),
                    size: 60,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color.fromARGB(255, 206, 161, 1),
                  size: 40,
                ),
              ],
            ),
          ],
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Available radios",
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: radioList == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => CustomRadioListTile(
                      radio: radioList![index],
                      isPlaying: false,
                      onTap: () {
                        final radio = radioList![index];
                        currentPlayingRadio = radio;
                        radioPlayer.setChannel(
                            title: radio.title ?? "",
                            url: radio.audioUrl ?? "",
                            imagePath: radio.image);
                        setState(() {});
                      },
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: radioList!.length,
                  ),
          ),
        ],
      ),
    );
  }
}
