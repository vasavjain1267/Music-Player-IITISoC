import 'package:flutter/material.dart';
import 'package:harmonix/app_drawer.dart';
import 'package:harmonix/section_title.dart';
//import 'package:harmonix/services/sharedpref.dart';
import 'package:harmonix/song_list.dart';
//import 'package:home_page/widgets/section_title.dart';
//import 'package:home_page/widgets/song_list.dart';
//import 'package:home_page/screens/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;

  HomeScreen({required this.onThemeChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  String? name;
  // getthesharedpref() async {
  //   name = await SharedPreferenceHelper().getUserName();
  //   //image = await SharedPreferenceHelper().getUserImage();
  //   setState(() {});
  // }

  // ontheload() async {
  //   await getthesharedpref();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   ontheload();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: name == null
        //     ? Center(child: CircularProgressIndicator())
        //     :
         title:   Text("Welcome" ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a song',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: AppDrawer(
        onThemeChanged: widget.onThemeChanged,
        username: 'user123',
        email: 'user@example.com',
        password: 'password123',
        toggleTheme: (bool value) {
          widget.onThemeChanged(value);
        },
      ),
      body: 
       SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionTitle(title: 'Recently Played'),
            SongList(
                songs: List.generate(
                    10, (index) => 'Recently Played Song ${index + 1}')),
            SectionTitle(title: 'Popular Hits'),
            SongList(
                songs:
                    List.generate(10, (index) => 'Popular Hit ${index + 1}')),
            SectionTitle(title: 'Hindi Hits'),
            SongList(
                songs: List.generate(10, (index) => 'Hindi Hit ${index + 1}')),
            SectionTitle(title: 'Punjabi Hits'),
            SongList(
                songs:
                    List.generate(10, (index) => 'Punjabi Hit ${index + 1}')),
            SectionTitle(title: 'English Hits'),
            SongList(
                songs:
                    List.generate(10, (index) => 'English Hit ${index + 1}')),
          ],
        ),
      ),
    );
  }
}
