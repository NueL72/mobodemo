import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ProfileScreen(), debugShowCheckedModeBanner: false));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.person_pin, color: Colors.blue, size: 30),
        title: const Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Join the repair revolution card
            _buildActionCard(),
            const SizedBox(height: 16),
            
            // Store Region selector
            _buildSettingsTile(
              icon: Icons.public,
              label: 'Store Region',
              trailingText: 'United Stat...',
              trailingWidget: const Text('🇺🇸', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 16),

            // Language selector
            _buildSettingsTile(
              icon: Icons.translate,
              label: 'Language',
              trailingText: 'English',
              trailingWidget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('EN', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 32),

            // Footer Information
            const Text('Version 1.1.6', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 12),
            const Text(
              'FixBot can make mistakes. Always verify critical details from reliable sources. This app uses cookies to store your cart and improve the app.',
              style: TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Text('Terms and', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            const Text('Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            const SizedBox(height: 8),
            // const Text('Delete Account', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- Helper Widgets ---

  Widget _buildActionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Join the repair revolution', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          const Text('Every time you fix something, you help the planet.', style: TextStyle(fontSize: 13)),
          const SizedBox(height: 20),
          _buildButton('Log In', const Color(0xFF4472C4), Colors.white),
          const SizedBox(height: 10),
          _buildButton('Join', const Color(0xFFD9E1F2), const Color(0xFF4472C4)),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSettingsTile({required IconData icon, required String label, required String trailingText, required Widget trailingWidget}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(trailingText, style: const TextStyle(color: Color(0xFF4472C4), fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          trailingWidget,
        ],
      ),
    );
  }

}