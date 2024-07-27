// import 'package:flutter/material.dart';
// //import 'package:harmonix/mainmusic/pages/library_page.dart';
// //import 'package:harmonix/mainmusic/pages/song_list_page.dart';
// import 'package:harmonix/music/library_page.dart';
// import 'package:harmonix/music/song_list_page.dart';
// import 'package:harmonix/radiofront/radiopage.dart';
// import 'package:harmonix/settings/setting_page.dart';

// class bottomnav extends StatefulWidget {
//   final String username;
//   final String email;

//   bottomnav({required this.username, required this.email});

//   @override
//   State<bottomnav> createState() => _bottomnavState();
// }

// class _bottomnavState extends State<bottomnav> {
//   late Widget homescreen;
//   late Widget library;
//   late Widget radio;
//   late Widget settings;
//   late List<Widget> pages;
//   int selectedIndex = 0;

//   @override
//   void initState() {
//     homescreen = SongListPage();
//     library = LibraryPage();
//     radio = RadioPage();
//     settings = SettingsPage(
//       username: widget.username,
//       email: widget.email,
//       toggleTheme: (bool value) {},
//     );

//     pages = [homescreen, library, radio, settings];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color.fromARGB(255, 236, 178, 3), // Background color of the BottomNavigationBar
//         selectedItemColor: Color.fromARGB(255, 248, 170, 1), // Color of the selected item
//         unselectedItemColor: Color.fromARGB(255, 222, 247, 208), // Color of the unselected items
//         currentIndex: selectedIndex,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.library_music), label: "Library"),
//           BottomNavigationBarItem(icon: Icon(Icons.radio), label: "Radio"),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//         ],
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:harmonix/music/library_page.dart';
import 'package:harmonix/music/song_list_page.dart';

import 'package:harmonix/musicmain/homescreen.dart';
import 'package:harmonix/musicmain/library.dart';
//import 'package:harmonix/musicmain/radio.dart';
import 'package:harmonix/radiofront/radiopage.dart';
import 'package:harmonix/settings/setting_page.dart';

class bottomnav extends StatefulWidget {
  final String username;
  final String email;

  const bottomnav({required this.username, required this.email});

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
    homescreen = SongListPage(
      username: widget.username!,
    );
    Library = LibraryPage();
    Radio = RadioPage();
    Settings = SettingsPage(
      username: widget.username,
      email: widget.email,
      toggleTheme: (bool value) {},
    );

    pages = [homescreen, Library, Radio, Settings];
    super.initState();
  }

  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
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
