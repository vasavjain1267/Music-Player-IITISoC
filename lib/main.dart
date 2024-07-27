import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:harmonix/firebase_options.dart';
//import 'package:harmonix/mainmusic/models/song_model.dart';
import 'package:harmonix/music/hive_service.dart';
import 'package:harmonix/musicmain/bottomnavbar.dart'; // Import BottomNavBar
import 'package:harmonix/screens/welcome.dart';
import 'package:harmonix/splashscreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';  // Import Firebase Auth

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Hive.initFlutter();
  // Hive.registerAdapter(SongModelAdapter());
  // await Hive.openBox<SongModel>('recentlyPlayed');
  // await Hive.openBox<SongModel>('favorites');
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  // Set initial route to splash screen
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => Welcome(),
        // '/bottomnavbar': (context) => bottomnav(),  // Define the BottomNavBar route
      },
      theme: ThemeData(
        fontFamily: "Merriweather",
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 197, 115, 9),
        primaryColor: Color.fromARGB(255, 197, 115, 8),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: "Merriweather",
      ),
      themeMode: _themeMode,
    );
  }
}
