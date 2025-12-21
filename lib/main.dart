import 'package:flutter/material.dart';
import 'package:mobowiza/screens/splash_screen.dart';
// Import your screens

void main() {
  runApp(RepairLocateApp());
}

class RepairLocateApp extends StatelessWidget {
  const RepairLocateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RepairLocate',
      // This tells the app to start with the Role Selection screen
      home: SplashScreen(), 
    );
  }
}