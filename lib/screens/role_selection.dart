import 'package:flutter/material.dart';
import 'package:mobowiza/pages/custome_firstPg.dart';
import 'package:mobowiza/screens/tech_dashboard.dart';
import '../core/constants.dart'; // Your colors
// import '../pages/customer_page.dart'; // Import the page you created

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Placeholder
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Image.asset(
                'assets/icon/bgno.png',
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "RepairLocate",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryNavy,
              ),
            ),
            const SizedBox(height: 40),

            // Customer role card
            _buildRoleCard(
              title: "I need a Repair",
              subtitle: "Find technicians near you",
              icon: Icons.search,
              onTap: () {
                // Navigate to CustomerPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RepairApp(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Technician role card
            _buildRoleCard(
              title: "I am a Technician",
              subtitle: "Grow your repair business",
              icon: Icons.build_rounded,
              onTap: () {
                // Replace with Technician dashboard navigation later
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TechDashboard(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryNavy.withOpacity(0.1)),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.accentOrange,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
