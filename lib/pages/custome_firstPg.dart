
// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() => runApp(RepairApp());

class RepairApp extends StatelessWidget {
  const RepairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: RepairBookingPage(),
    );
  }
}

class RepairBookingPage extends StatefulWidget {
  const RepairBookingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RepairBookingPageState createState() => _RepairBookingPageState();
}

class _RepairBookingPageState extends State<RepairBookingPage> {
  int _currentStep = 0;
  String? selectedDevice;
  String? selectedIssue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book a Repair")),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) setState(() => _currentStep += 1);
        },
        onStepCancel: () {
          if (_currentStep > 0) setState(() => _currentStep -= 1);
        },
        steps: [
          // STEP 1: DEVICE SELECTION
          Step(
            title: Text("Device"),
            isActive: _currentStep >= 0,
            content: Column(
              children: [
                _buildSelectionCard("iPhone 15", Icons.phone_iphone),
                _buildSelectionCard("Dell XPS 13", Icons.laptop),
                _buildSelectionCard("MacBook Pro", Icons.laptop_mac),
              ],
            ),
          ),
          // STEP 2: ISSUE & PHOTO
          Step(
            title: Text("Issue"),
            isActive: _currentStep >= 1,
            content: Column(
              children: [
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("Select Issue"),
                  value: selectedIssue,
                  items: ["Broken Screen", "Battery Replacement", "Water Damage"]
                      .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedIssue = val),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {}, // Trigger Image Picker
                  icon: Icon(Icons.camera_alt),
                  label: Text("Upload Damage Photos"),
                ),
              ],
            ),
          ),
          // STEP 3: ESTIMATE & TRACKING
          Step(
            title: Text("Confirm"),
            isActive: _currentStep >= 2,
            content: Column(
              children: [
                Card(
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Estimated Price: \$150.00", 
                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20),
                Text("Repair Progress:"),
                _buildTrackingIndicator(2), // Mocking 'Repairing' stage
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionCard(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Radio<String>(
        value: title,
        // ignore: deprecated_member_use
        groupValue: selectedDevice,
        // ignore: deprecated_member_use
        onChanged: (val) => setState(() => selectedDevice = val),
      ),
    );
  }

  Widget _buildTrackingIndicator(int currentStage) {
    List<String> stages = ["Received", "Assigned", "Repairing", "Ready"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stages.asMap().entries.map((entry) {
        bool isDone = entry.key <= currentStage;
        return Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: isDone ? Colors.green : Colors.grey.shade300,
              child: Icon(Icons.check, size: 15, color: Colors.white),
            ),
            Text(entry.value, style: TextStyle(fontSize: 10)),
          ],
        );
      }).toList(),
    );
  }
}