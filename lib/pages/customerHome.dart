import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FixerApp()));

class FixerApp extends StatelessWidget {
  const FixerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 30),
              const Text(
                "Hi there, welcome!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                "Never take broken for an answer! Join fixers around the world and learn to fix any thing yourself.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 25),
              _buildSearchBar(),
              const SizedBox(height: 25),
              _buildBatteryCard(),
              const SizedBox(height: 20),
              _buildFixBotCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFF4A78D0),
          child: Icon(Icons.close, color: Colors.white),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.person, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF4A78D0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, color: Colors.white, size: 20),
          SizedBox(width: 8),
          Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBatteryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEAEA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tag("Beta", const Color(0xFFA52A2A)),
                const SizedBox(height: 12),
                const Text("Battery Health: Poor", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                _iconText(Icons.battery_std, "Capacity:"),
                _iconText(Icons.refresh, "Cycles Used:"),
                const SizedBox(height: 15),
                const Text("Help Me Fix", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ],
            ),
          ),
          // Circular Health Indicator
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: 0.8,
                  strokeWidth: 8,
                  backgroundColor: Colors.red.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFA52A2A)),
                ),
              ),
              const Icon(Icons.sentiment_very_dissatisfied, size: 40, color: Color(0xFFA52A2A)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFixBotCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD0E3FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tag("NEW!", const Color(0xFF1A4A9B)),
          const SizedBox(height: 12),
          const Text("Solve your problems smarter with FixBot", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          const Text("- Get help from our AI repair expert\n- Instant photo identification\n- Skip hours of guesswork"),
          const SizedBox(height: 15),
          const Text("Try it now.\nFree for a limited time!", style: TextStyle(fontSize: 13)),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ask FixBot", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Icon(Icons.smart_toy_outlined, color: Colors.white, size: 18),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}