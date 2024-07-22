// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'models/song_model.dart';
// import 'pages/home_screen.dart';

// void main() async {
//   await Hive.initFlutter();
//   Hive.registerAdapter(SongModelAdapter());
//   await Hive.openBox<SongModel>('recentlyPlayed');
//   await Hive.openBox<SongModel>('favorites');
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Music App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
