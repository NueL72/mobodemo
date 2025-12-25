import 'package:flutter/material.dart';
import 'package:mobowiza/Customerpages/customer_page.dart';
import 'AccountProfile.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigationWrapper(),
    ));

// --- THE WRAPPER CLASS ---
class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({super.key});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const RepairBookingPage(),
    const Center(child: Text("Technician Screen")),
    const CustomerPage(),
    const Center(child: Text("Cart Screen")),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
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
            onTap: (index) => setState(() => _currentIndex = index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.build), label: "Tech"),
              BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: "Feed"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
            ],
          ),
        ),
      ),
    );
  }
}

// --- THE REPAIR BOOKING PAGE (Combined Layout) ---
class RepairBookingPage extends StatelessWidget {
  const RepairBookingPage({super.key});

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
              _buildHeader(), // Replaced bolt with your bgno.png logo
              const SizedBox(height: 20),
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
              // --- ORIGINAL LAYOUT CARDS ---
              _buildBatteryCard(),
              const SizedBox(height: 20),
              _buildFixBotCard(),
              
              const SizedBox(height: 25),
              // --- NEW LAYOUT CARDS (FROM SCREENSHOT) ---
              _buildRepairDontReplaceBanner(),
              const SizedBox(height: 25),
              
              _buildSectionHeader(Icons.grid_view_rounded, "My Devices", showSeeAll: true),
              const SizedBox(height: 15),
              _buildWorkbenchPrompt(),
              const SizedBox(height: 15),
              _buildHorizontalDeviceList(),
              
              const SizedBox(height: 30),
              _buildSectionHeader(Icons.storefront_outlined, "Best Sellers"),
              const SizedBox(height: 15),
              _buildHorizontalProductList(),
              
              const SizedBox(height: 100), // Space for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  // --- UI COMPONENTS: MODIFIED HEADER ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Your Custom Logo
        Image.asset(
          'assets/icon/bgno.png', // Ensure this path matches your pubspec.yaml
          height: 60,
          width: 80,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback if the image fails to load
            return const Icon(Icons.broken_image, size: 40, color: Colors.blue);
          },
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: const Icon(Icons.person, color: Colors.black54),
        ),
      ],
    );
  }

  // --- OTHER UI COMPONENTS (KEPT FROM PREVIOUS VERSION) ---

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: const Color(0xFF4A78D0), borderRadius: BorderRadius.circular(12)),
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.search, color: Colors.white, size: 20), SizedBox(width: 8), Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
    );
  }

  Widget _buildBatteryCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFFFEAEA), borderRadius: BorderRadius.circular(20)),
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
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80, height: 80,
                child: CircularProgressIndicator(
                  value: 0.8, strokeWidth: 8,
                  backgroundColor: Colors.red.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFA52A2A)),
                ),
              ),
              const Icon(Icons.sentiment_very_dissatisfied, size: 35, color: Color(0xFFA52A2A)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFixBotCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFD0E3FF), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tag("NEW!", const Color(0xFF1A4A9B)),
          const SizedBox(height: 12),
          const Text("Solve your problems smarter with FixBot", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
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

  Widget _buildRepairDontReplaceBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFEFFFDC), borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Repair, don't replace", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 8),
                Text("Every fix keeps ≈ 1 kg of e-waste out of landfills.", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFC7E596), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.public, color: Color(0xFF4C6B1F), size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title, {bool showSeeAll = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF4A90E2), size: 22),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        if (showSeeAll)
          const Text("See all >", style: TextStyle(color: Color(0xFF4A90E2), fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildWorkbenchPrompt() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Add a device to your workbench", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text("Get quick access to guides, parts, and tips.", style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          const Icon(Icons.close, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  Widget _buildHorizontalDeviceList() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDeviceCard(isAddButton: true),
          _buildDeviceCard(name: "Google Pixel 4a"),
        ],
      ),
    );
  }

  Widget _buildDeviceCard({String? name, bool isAddButton = false}) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: isAddButton 
          ? [const Icon(Icons.add, size: 30, color: Colors.grey), const Text("Add new")]
          : [const Icon(Icons.phone_android, size: 50), const SizedBox(height: 12), Text(name!)],
      ),
    );
  }

  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildProductCard("Mako Driver Kit", "\$39.95"),
          _buildProductCard("Pro Tech Toolkit", "\$74.95"),
          _buildProductCard("Prying Tool", "\$9.95"),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String price) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 100, width: double.infinity, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: const Icon(Icons.build, color: Colors.grey)),
          const SizedBox(height: 10),
          Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _tag(String text, Color color) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)), child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)));
  }

  Widget _iconText(IconData icon, String text) {
    return Row(children: [Icon(icon, size: 16, color: Colors.grey[700]), const SizedBox(width: 5), Text(text, style: const TextStyle(fontWeight: FontWeight.w500))]);
  }
}
