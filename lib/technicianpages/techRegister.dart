import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: TechnicianRegisterScreen()));

class TechnicianRegisterScreen extends StatefulWidget {
  const TechnicianRegisterScreen({super.key});

  @override
  State<TechnicianRegisterScreen> createState() => _TechnicianRegisterScreenState();
}

class _TechnicianRegisterScreenState extends State<TechnicianRegisterScreen> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Image.network('https://flagcdn.com/w40/tz.png', width: 24), // Tanzania Flag
                const SizedBox(width: 8),
                const Text('EN', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Become a technician',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333E48)),
            ),
            const SizedBox(height: 30),

            // Email Field
            const _FieldLabel(label: 'Email'),
            const _CustomTextField(hintText: 'Enter email address'),

            const SizedBox(height: 20),

            // Phone Number Field
            const _FieldLabel(label: 'Phone number'),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F4F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.network('https://flagcdn.com/w20/tz.png', width: 20),
                      const SizedBox(width: 8),
                      const Text('+255', style: TextStyle(fontSize: 16)),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: _CustomTextField(hintText: 'Mobile number'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // City Field
            const _FieldLabel(label: 'City'),
            const _CustomTextField(
              hintText: 'Dar es Salaam',
              suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ),

            const SizedBox(height: 30),

            // Terms and Conditions Checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _agreedToTerms,
                    onChanged: (val) => setState(() => _agreedToTerms = val!),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'By registering, you agree to our Terms of Service and Privacy policy. Commit to providing quality repair services on the platform.',
                    style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Register Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _agreedToTerms ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4472C4), // Muted Green
                  disabledBackgroundColor: const Color(0xFF4472C4).withOpacity(0.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                child: const Text(
                  'Register as a technician',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Label Widget
class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF333E48)),
      ),
    );
  }
}

// Reusable Text Field Widget
class _CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  const _CustomTextField({required this.hintText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF2F4F7),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
    );
  }
}