import 'package:flutter/material.dart'; // THIS WAS MISSING
import '../core/constants.dart';       // This links your colors
  // ... rest of your code

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
                  height: 150,           // You can increase or decrease this
                  width: 150,            // Keeping it square usually looks best for shield logos
                  fit: BoxFit.contain,    // This ensures the logo isn't cropped
                ),
              ),
            Text("RepairLocate", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryNavy)),
            SizedBox(height: 40),
            
            _buildRoleCard(
              title: "I need a Repair",
              subtitle: "Find technicians near you",
              icon: Icons.search,
              onTap: () => print("Navigate to Customer Home"),
            ),
            SizedBox(height: 16),
            _buildRoleCard(
              title: "I am a Technician",
              subtitle: "Grow your repair business",
              icon: Icons.build_rounded,
              onTap: () => print("Navigate to Tech Dashboard"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard({required String title, required String subtitle, required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryNavy.withOpacity(0.1)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundColor: AppColors.accentOrange, child: Icon(icon, color: Colors.white)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(subtitle, style: TextStyle(color: Colors.grey[600])),
              ],
            )
          ],
        ),
      ),
    );
  }
}