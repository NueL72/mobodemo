import 'package:flutter/material.dart';
import 'dart:async';
import 'role_selection.dart';
import '../core/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // This timer keeps the logo on screen for 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Match your logo background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your rounded logo
            ClipRRect(
              borderRadius: BorderRadius.circular(100), // Makes it rounded
              child: Image.asset(
                'assets/icon/bgno.png',
                width: 180,
                height: 180,
              ),
            ),
            SizedBox(height: 20),
            // Optional: A small loading indicator that matches your theme
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentOrange),
            ),
          ],
        ),
      ),
    );
  }
}