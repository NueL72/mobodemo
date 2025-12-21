import 'package:flutter/material.dart'; // THIS WAS MISSING
import '../core/constants.dart';

class TechDashboard extends StatefulWidget {
  const TechDashboard({super.key});

  @override
  _TechDashboardState createState() => _TechDashboardState();
}

class _TechDashboardState extends State<TechDashboard> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Dashboard", style: TextStyle(color: AppColors.primaryNavy)),
        actions: [IconButton(icon: Icon(Icons.settings, color: Colors.grey), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Toggle
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(child: _statusBtn("You are online", isOnline, AppColors.successGreen)),
                  Expanded(child: _statusBtn("You are hidden", !isOnline, AppColors.accentOrange)),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text("Quick Stats", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statCard("17", "Views", Icons.remove_red_eye),
                _statCard("20", "Inquiries", Icons.chat_bubble),
                _statCard("4.8", "Rating", Icons.star),
              ],
            ),
            SizedBox(height: 24),
            Text("Inquiry Inbox", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _inquiryItem("Broken Screen", "iPhone 13 Pro Max", "0.5km away"),
            _inquiryItem("Battery Replacement", "Samsung S22", "1.2km away"),
          ],
        ),
      ),
    );
  }

  Widget _statusBtn(String label, bool active, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: active ? color : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.grey, fontWeight: FontWeight.bold))),
    );
  }

  Widget _statCard(String val, String label, IconData icon) {
    return Container(
      width: 100, padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryNavy, size: 20),
          Text(val, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _inquiryItem(String issue, String model, String dist) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(issue, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(model, style: TextStyle(color: Colors.grey)),
            Text(dist, style: TextStyle(color: AppColors.accentOrange, fontSize: 12)),
          ]),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.accentOrange),
            child: Text("View Details"),
          )
        ],
      ),
    );
  }
}