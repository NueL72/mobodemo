import 'package:flutter/material.dart';

void main() {
  runApp(const RepairApp());
}

class RepairApp extends StatelessWidget {
  const RepairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFDFDFD),
      ),
      home: const RepairSignUpScreen(),
    );
  }
}

class RepairSignUpScreen extends StatefulWidget {
  const RepairSignUpScreen({super.key});

  @override
  State<RepairSignUpScreen> createState() => _RepairSignUpScreenState();
}

class _RepairSignUpScreenState extends State<RepairSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The bottomNavigationBar property has been removed from here
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              const Text(
                "Join the world's largest repair community",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              const _FeatureRow(
                icon: Icons.build_outlined,
                text: "Learn from 2.5 million like-minded fixers",
              ),
              const _FeatureRow(
                icon: Icons.edit_outlined,
                text: "Share your repair expertise with step-by-step guides",
              ),
              const _FeatureRow(
                icon: Icons.wb_sunny_outlined,
                text: "Participate to earn reputation and help fix the world",
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Log in.",
                      style: TextStyle(color: Color(0xFF3B71CA), fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SocialButton(
                      label: "Sign up with Google",
                      assetPath: "assets/icon/google.png",
                    ),
                    const SizedBox(height: 12),
                    const _SocialButton(
                      label: "Sign up with Facebook",
                      icon: Icons.facebook,
                      iconColor: Color(0xFF1877F2),
                    ),
                    const SizedBox(height: 25),
                    const _OrDivider(),
                    const SizedBox(height: 25),
                    const Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "albert@domain.com",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter your email address to login or sign up.",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0066CC),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sub-widgets remain the same
class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF4A90E2), size: 28),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final String? assetPath;
  final IconData? icon;
  final Color? iconColor;

  const _SocialButton({required this.label, this.assetPath, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (assetPath != null)
            Image.asset(assetPath!, height: 22)
          else
            Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text("OR", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}