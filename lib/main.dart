import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:harmonix/firebase_options.dart';
import 'package:harmonix/home_screen.dart';
import 'package:harmonix/musicmain/bottomnavbar.dart';

import 'package:harmonix/settings/setting_page.dart';
import 'package:harmonix/screens/welcome.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //.then((value) => Get.put(AuthenticationRepository()));
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
    // Replace with actual user data obtained during signup or login
    const String username = "spotifyUser";
    const String email = "spotify@example.com";
    const String password = "spotifyPassword123";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
//home: HomeScreen(onThemeChanged: _toggleTheme),
       //home: bottomnav(),
      // home: SettingsPage(
      //   username: username,
      //   email: email,
      //   password: password,
      //   toggleTheme: _toggleTheme,
      // ),
      theme: ThemeData(
        fontFamily: "Merriweather",
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 197, 115, 9),
        //scaffoldBackgroundColor: Colors.white,
        primaryColor: Color.fromARGB(255, 197, 115, 8),
        useMaterial3: true,
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   brightness: Brightness.light,
      //   // scaffoldBackgroundColor: Colors.white,
      // ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: "Merriweather",
      ),
      themeMode: _themeMode,
    );
  }
}
