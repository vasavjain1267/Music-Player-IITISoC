// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:harmonix/mainmusic/pages/home_screen.dart';
import 'package:harmonix/mainmusic/pages/library_page.dart';
import 'package:harmonix/mainmusic/pages/song_list_page.dart';

import 'package:harmonix/musicmain/homescreen.dart';
import 'package:harmonix/musicmain/library.dart';
//import 'package:harmonix/musicmain/radio.dart';
import 'package:harmonix/radiofront/radiopage.dart';
import 'package:harmonix/settings/setting_page.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  late List<Widget> pages;
  late SongListPage homescreen;
  late SettingsPage Settings;
  late LibraryPage Library;
  late RadioPage Radio;

  int currentTabIndex = 0;

  @override
  void initState() {
    homescreen = SongListPage();
    Library = LibraryPage();
    Radio = RadioPage();
    Settings = SettingsPage(
      username: username,
      email: email,
    );

    pages = [homescreen, Library, Radio, Settings];
    super.initState();
  }



  String username = "spotifyUser";
  String email = "spotify@example.com";
  String password = "spotifyPassword123";

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          backgroundColor: Color.fromARGB(255, 139, 119, 5),
          color: Color.fromARGB(255, 15, 15, 15),
          animationCurve: Curves.easeInOutExpo,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 224, 173, 3),
            ),
            Icon(
              Icons.library_music,
              color: Color.fromARGB(255, 224, 173, 3),
            ),
            Icon(
              Icons.radio,
              color: Color.fromARGB(255, 224, 173, 3),
            ),
            Icon(
              Icons.settings,
              color: Color.fromARGB(255, 224, 173, 3),
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
