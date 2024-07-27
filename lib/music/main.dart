// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'song_list_page.dart';
// import 'library_page.dart';
// import 'hive_service.dart';

// void main() async {
//   await HiveService.init();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Music App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _pageIndex = 0;

//   final List<Widget> _pages = [
//     SongListPage(),
//     LibraryPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.white,
//         items: <Widget>[
//           Icon(Icons.music_note, size: 30),
//           Icon(Icons.library_music, size: 30),
//         ],
//         onTap: (index) {
//           setState(() {
//             _pageIndex = index;
//           });
//         },
//       ),
//       body: _pages[_pageIndex],
//     );
//   }
// }
