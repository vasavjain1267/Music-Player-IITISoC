import 'package:flutter/material.dart';
import 'package:harmonix/mainmusic/pages/library_page.dart';
import 'package:harmonix/mainmusic/pages/song_list_page.dart';
import 'package:harmonix/radiofront/radiopage.dart';
import 'package:harmonix/settings/setting_page.dart';

class bottomnav extends StatefulWidget {
  final String username;
  final String email;

  bottomnav({required this.username, required this.email});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  late Widget homescreen;
  late Widget library;
  late Widget radio;
  late Widget settings;
  late List<Widget> pages;
  int selectedIndex = 0;

  @override
  void initState() {
    homescreen = SongListPage();
    library = LibraryPage();
    radio = RadioPage();
    settings = SettingsPage(
      username: widget.username,
      email: widget.email,
      toggleTheme: (bool value) {},
    );

    pages = [homescreen, library, radio, settings];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 236, 178, 3), // Background color of the BottomNavigationBar
        selectedItemColor: Color.fromARGB(255, 248, 170, 1), // Color of the selected item
        unselectedItemColor: Color.fromARGB(255, 222, 247, 208), // Color of the unselected items
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: "Radio"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
