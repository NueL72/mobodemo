import 'package:flutter/material.dart';
import 'screens/role_selection.dart'; // Import your screens

void main() {
  runApp(RepairLocateApp());
}

class RepairLocateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RepairLocate',
      // This tells the app to start with the Role Selection screen
      home: RoleSelectionScreen(), 
    );
  }
}