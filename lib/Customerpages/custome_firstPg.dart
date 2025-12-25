// ignore_for_file: library_private_types_in_public_api
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobowiza/Customerpages/customer_page.dart';
import 'AccountProfile.dart';
void main() => runApp(const RepairApp());

class RepairApp extends StatelessWidget {
  const RepairApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainNavigationWrapper(),
    );
  }
}

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

class RepairBookingPage extends StatefulWidget {
  const RepairBookingPage({super.key});

  @override
  _RepairBookingPageState createState() => _RepairBookingPageState();
}

class _RepairBookingPageState extends State<RepairBookingPage> {
  int _currentStep = 0;
  String? selectedDevice;
  String? selectedIssue;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Select Image Source',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.blue),
                title: const Text('Photo Gallery'),
                onTap: () async {
                  Navigator.pop(context); // Close the menu
                  final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() => _imageFile = File(pickedFile.path));
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.green),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context); // Close the menu
                  final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() => _imageFile = File(pickedFile.path));
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book a Repair"), centerTitle: true),
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
          Step(
            title: const Text("Device"),
            isActive: _currentStep >= 0,
            content: Column(
              children: [
                _buildSelectionCard("iPhone 15", Icons.phone_iphone),
                _buildSelectionCard("Dell XPS 13", Icons.laptop),
                _buildSelectionCard("MacBook Pro", Icons.laptop_mac),
              ],
            ),
          ),
          Step(
            title: const Text("Issue"),
            isActive: _currentStep >= 1,
            content: Column(
              children: [
                DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Select Issue"),
                  value: selectedIssue,
                  items: ["Broken Screen", "Battery Replacement", "Water Damage"]
                      .map((label) => DropdownMenuItem(value: label, child: Text(label)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedIssue = val),
                ),
                const SizedBox(height: 20),
                if (_imageFile != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.file(_imageFile!, height: 100),
                  ),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Upload Damage Photos"),
                ),
              ],
            ),
          ),
          Step(
            title: const Text("Confirm"),
            isActive: _currentStep >= 2,
            content: Column(
              children: [
                Card(
                  color: Colors.blue.shade50,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Estimated Price: \$150.00", 
                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTrackingIndicator(2),
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
        groupValue: selectedDevice,
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
              radius: 12,
              backgroundColor: isDone ? Colors.green : Colors.grey.shade300,
              child: const Icon(Icons.check, size: 12, color: Colors.white),
            ),
            Text(entry.value, style: const TextStyle(fontSize: 10)),
          ],
        );
      }).toList(),
    );
  }
}