import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// I removed the main() and MaterialApp here so you can integrate it into your app easily.

class ProfilePage extends StatefulWidget {
  // NEW: Added this to accept the Google account data
  final GoogleSignInAccount user; 

  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Tracking the current index for the navigation bar
  int _currentIndex = 2; // Defaulting to 'Account' index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.person_pin_rounded, color: Colors.blue, size: 30),
        title: const Text('Profile',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          // --- Profile Header (Modified ONLY the data lines) ---
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade900,
                // NEW: Added the Google Profile Photo logic
                backgroundImage: widget.user.photoUrl != null 
                    ? NetworkImage(widget.user.photoUrl!) 
                    : null,
                child: widget.user.photoUrl == null 
                    ? Text(widget.user.displayName?[0] ?? '?', 
                        style: const TextStyle(color: Colors.white, fontSize: 24))
                    : null,
              ),
              const SizedBox(width: 15),
              Column( // Removed 'const' here to allow dynamic data
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NEW: Using actual Name from Google
                  Text(widget.user.displayName ?? "No Name",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  // NEW: Using actual Email from Google
                  Text(widget.user.email, style: const TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),

          // --- Menu Items (Exactly as provided) ---
          _buildMenuItem(Icons.public, "Store Region",
              trailingText: "United Stat...", trailingIcon: Icons.flag),
          _buildMenuItem(Icons.translate, "Language",
              trailingText: "English", isLanguage: true),
          _buildMenuItem(Icons.account_box_outlined, "About"),
          _buildMenuItem(Icons.list_alt_rounded, "Activity"),
          _buildMenuItem(Icons.wb_sunny_rounded, "Reputation"),
          _buildMenuItem(Icons.notifications_none_rounded, "Notifications"),
          _buildMenuItem(Icons.store_outlined, "Order History"),

          const SizedBox(height: 25),

          // --- My Devices Header (Exactly as provided) ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.grid_view_rounded, color: Colors.blue.shade300),
                  const SizedBox(width: 10),
                  const Text("My Devices",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text("See all", style: TextStyle(color: Colors.black)),
                    Icon(Icons.chevron_right, color: Colors.black),
                  ],
                ),
              )
            ],
          ),

          // --- Device Cards (Exactly as provided) ---
          Row(
            children: [
              _buildDeviceCard(Icons.add, "Add new", isAdd: true),
              const SizedBox(width: 15),
              _buildDeviceCard(null, "Product Details"),
            ],
          ),
          const SizedBox(height: 120), 
        ],
      ),

      // --- BOTTOM NAVIGATION BAR (Exactly as provided) ---
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: "Feed"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
            ],
          ),
        ),
      ),
    );
  }

  // Helper methods (Exactly as provided)
  Widget _buildMenuItem(IconData icon, String title,
      {String? trailingText, IconData? trailingIcon, bool isLanguage = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText != null)
              Text(trailingText,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            if (isLanguage)
              Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Text("EN",
                      style: TextStyle(color: Colors.white, fontSize: 10))),
            if (trailingIcon != null) const Icon(Icons.flag, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard(IconData? icon, String label, {bool isAdd = false}) {
    return Container(
      width: 140,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isAdd
              ? Icon(icon, size: 40, color: Colors.black54)
              : Container(height: 80, width: 40, color: Colors.orange),
          const SizedBox(height: 10),
          Text(label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}