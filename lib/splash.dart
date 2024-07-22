// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:harmonix/screens/welcome.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..addListener(() {
//         setState(() {});
//       });
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _controller.forward();

//     Future.delayed(Duration(seconds: 4), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Welcome()));
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color.fromARGB(255, 227, 227, 230), Color(0xFF004e92)],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FadeTransition(
//                 opacity: _animation,
//                 child: Column(
//                   children: [
//                      Image.asset(
//                       'assests/images/Music.png',
//                       height: 200,
//                     ),
//                     SizedBox(height: 20),
//             Text(
//               'Set Mood with Good Music',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context, MaterialPageRoute(builder: (context) => Welcome()));
//               },
//               child: Text('Get Started'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                 textStyle: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//             ]
//           )
//         )
//       )
//     ); 
//   }
// }