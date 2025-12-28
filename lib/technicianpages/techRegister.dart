import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TechnicianRegisterScreen(),
    ));

class TechnicianRegisterScreen extends StatefulWidget {
  const TechnicianRegisterScreen({super.key});

  @override
  State<TechnicianRegisterScreen> createState() =>
      _TechnicianRegisterScreenState();
}

class _TechnicianRegisterScreenState extends State<TechnicianRegisterScreen> {
  bool _agreedToTerms = false;
  bool _showFormSteps = false;

  @override
  Widget build(BuildContext context) {
    if (_showFormSteps) {
      return const BoltMultiStepRegistration();
    }

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
                Image.network('https://flagcdn.com/w40/tz.png', width: 24),
                const SizedBox(width: 8),
                const Text('EN',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
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
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333E48)),
            ),
            const SizedBox(height: 30),
            const _FieldLabel(label: 'Email'),
            const _CustomTextField(hintText: 'Enter email address'),
            const SizedBox(height: 20),
            const _FieldLabel(label: 'Phone number'),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
            const _FieldLabel(label: 'City'),
            const _CustomTextField(
              hintText: 'Dar es Salaam',
              suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _agreedToTerms,
                    onChanged: (val) => setState(() => _agreedToTerms = val!),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'By registering, you agree to our Terms of Service and Privacy policy. Commit to providing quality repair services on the platform.',
                    style:
                        TextStyle(fontSize: 13, color: Colors.grey, height: 1.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _agreedToTerms
                    ? () => setState(() => _showFormSteps = true)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF62B384),
                  disabledBackgroundColor:
                      const Color(0xFF62B384).withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                child: const Text(
                  'Register as a technician',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- MULTI-STEP REGISTRATION FLOW ---

class BoltMultiStepRegistration extends StatefulWidget {
  const BoltMultiStepRegistration({super.key});

  @override
  State<BoltMultiStepRegistration> createState() =>
      _BoltMultiStepRegistrationState();
}

class _BoltMultiStepRegistrationState extends State<BoltMultiStepRegistration> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final int _totalSteps = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Register",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => const TechnicianRegisterScreen()),
          ),
        ),
      ),
      // NO SHADOW: Navigation bar is now plain white to match the body
      bottomNavigationBar: _buildBottomNavigation(),
      body: Column(
        children: [
          _buildSegmentedProgressBar(),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (idx) => setState(() => _currentStep = idx),
              children: [
                _buildPersonalInfo(),
                _buildVehicleDetails(),
                _buildDocuments(),
                _buildPaymentDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: List.generate(_totalSteps, (index) {
          return Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index <= _currentStep
                    ? const Color(0xFF62B384)
                    : const Color(0xFFF2F4F7),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Text('Personal information',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Only your first name and vehicle details are visible to clients.'),
        SizedBox(height: 24),
        _FieldLabel(label: 'First and middle name *'),
        _CustomTextField(hintText: 'Emmanuel'),
        SizedBox(height: 16),
        _FieldLabel(label: 'Last name *'),
        _CustomTextField(hintText: 'Siaga'),
        SizedBox(height: 16),
        _FieldLabel(label: 'Language *'),
        _CustomTextField(
          hintText: 'English, American',
          suffixIcon: Icon(Icons.keyboard_arrow_down),
        ),
      ],
    );
  }

  Widget _buildVehicleDetails() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Text('Vehicle details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 24),
        _FieldLabel(label: 'National ID *'),
        _CustomTextField(hintText: '38809036666'),
        SizedBox(height: 16),
        _FieldLabel(label: 'Driver license number *'),
        _CustomTextField(hintText: 'AB235235'),
        SizedBox(height: 16),
        _FieldLabel(label: 'Vehicle owner name *'),
        _CustomTextField(hintText: 'Enter name'),
      ],
    );
  }

  Widget _buildDocuments() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text('Documents',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Scans and quality photos are accepted.'),
        const SizedBox(height: 20),
        _uploadSection('Picha ya dereva *', 'Ionekane vizuri na background nyeupe'),
        _uploadSection('Leseni ya dereva *', 'Hakikisha unapaki picha inayoonekana'),
        _uploadSection('Kitambulisho cha taifa *', 'Pakia NIDA, Mpiga kura au Passport'),
        _uploadSection('LATRA Sticker *', 'Pakia stika halali ya LATRA'),
      ],
    );
  }

  Widget _buildPaymentDetails() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text('Payment details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        const _FieldLabel(label: 'Address *'),
        const _CustomTextField(hintText: 'Please input home address'),
        const SizedBox(height: 16),
        const _FieldLabel(label: 'Account Holder Name *'),
        const _CustomTextField(hintText: 'Mobile money account name'),
        const SizedBox(height: 16),
        const _FieldLabel(label: 'Mobile money network *'),
        const _CustomTextField(
          hintText: 'Select network',
          suffixIcon: Icon(Icons.keyboard_arrow_down),
        ),
      ],
    );
  }

  Widget _uploadSection(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FieldLabel(label: title),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 12),
          SizedBox(
            width: 150,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: const Text("Upload file"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFF2F4F7),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const Divider(height: 30),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          // BoxShadow removed here
        ),
        child: Row(
          children: [
            if (_currentStep > 0)
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
                  child: const Text("Back", style: TextStyle(color: Colors.black54, fontSize: 16)),
                ),
              ),
            if (_currentStep > 0) const SizedBox(width: 15),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentStep < _totalSteps - 1) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    } else {
                      // Final Submit logic
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF62B384),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                  ),
                  child: Text(_currentStep == _totalSteps - 1 ? "Submit" : "Next",
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SHARED COMPONENTS ---

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Color(0xFF333E48), fontSize: 14),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  const _CustomTextField({required this.hintText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF2F4F7),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
    );
  }
}