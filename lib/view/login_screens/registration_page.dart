import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/repositories/widgets/widget_bagournd.dart';
import 'package:lorem_ipsum/view/login_screens/home/homescreen_.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isRegisteredBusiness = false;
  String? selectedIndustry;
  bool showDropdownOptions = false;
  bool showSuccessPopup = false; // Add this flag for showing success popup

  final List<String> industries = ['1 Industry', '2 Industry', '3 Industry'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: Stack(
        children: [
          createBackgroundWithPinkCorners(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallScreen ? 24 : 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Scrollable content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Your Name
                            _buildLabel('Your Name', screenWidth),
                            SizedBox(height: screenHeight * 0.01),
                            _buildTextField(
                                'Enter your Name', screenWidth, screenHeight),

                            SizedBox(height: screenHeight * 0.025),

                            // Brand Name
                            _buildLabel('Brand name (Optional)', screenWidth),
                            SizedBox(height: screenHeight * 0.01),
                            _buildTextField('Enter your Brand name',
                                screenWidth, screenHeight),

                            SizedBox(height: screenHeight * 0.025),

                            // Email ID
                            _buildLabel('Email ID', screenWidth),
                            SizedBox(height: screenHeight * 0.01),
                            _buildTextField('Enter your Email ID', screenWidth,
                                screenHeight),

                            SizedBox(height: screenHeight * 0.025),

                            // Product Details
                            _buildLabel('Product Details', screenWidth),
                            SizedBox(height: screenHeight * 0.01),
                            _buildTextField(
                              'Enter your Details',
                              screenWidth,
                              screenHeight,
                              maxLines: 3,
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Registered Business Toggle
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Are you a registered\nbusiness or organization ?',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: screenWidth * 0.04,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isRegisteredBusiness =
                                          !isRegisteredBusiness;
                                    });
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: isRegisteredBusiness
                                          ? const Color(0xFF00C853)
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: isRegisteredBusiness
                                            ? const Color.fromARGB(
                                                255, 255, 255, 255)
                                            : Colors.white.withOpacity(0.3),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: isRegisteredBusiness
                                        ? Center(
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: screenWidth * 0.04,
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),

                            // Conditional Business Fields
                            if (isRegisteredBusiness) ...[
                              SizedBox(height: screenHeight * 0.03),

                              // Company Name
                              _buildLabel('Company Name.', screenWidth),
                              SizedBox(height: screenHeight * 0.01),
                              _buildTextField(
                                  'Enter your Name', screenWidth, screenHeight),

                              SizedBox(height: screenHeight * 0.025),

                              // Company Address
                              _buildLabel('Company Address.', screenWidth),
                              SizedBox(height: screenHeight * 0.01),
                              _buildTextField('Enter your Company Address',
                                  screenWidth, screenHeight),

                              SizedBox(height: screenHeight * 0.025),

                              // Company GST
                              _buildLabel('Company GST No.', screenWidth),
                              SizedBox(height: screenHeight * 0.01),
                              _buildTextField('Enter your Company GST',
                                  screenWidth, screenHeight),

                              SizedBox(height: screenHeight * 0.025),

                              // Industry Type
                              _buildLabel(
                                  'What type of industry is your company.',
                                  screenWidth),
                              SizedBox(height: screenHeight * 0.01),
                              _buildDropdown(screenWidth, screenHeight),
                            ],

                            SizedBox(height: screenHeight * 0.04),
                          ],
                        ),
                      ),
                    ),

                    // Continue Button
                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFB148FF),
                            Color(0xFFFF6B9D),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            _showSuccessBottomSheet(context);
                          },
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ),

          // Success Popup (shown conditionally)
          if (showSuccessPopup)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 9.0, sigmaY: 9.0),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),

          if (showSuccessPopup)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 136, 135, 135)
                          .withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.08),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Profile icon with success checkmark
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 280,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(
                                            10,
                                          ),
                                          topRight: Radius.circular(10)),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromARGB(47, 232, 232,
                                              232), // Dark gray top
                                          Color.fromARGB(47, 232, 232,
                                              232), // Medium gray middle
                                          Color.fromARGB(0, 232, 232,
                                              232), // Light gray/white bottom
                                        ],
                                        stops: [0.0, 0.5, 1.0],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              // Profile circle with checkmark
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    width: 85,
                                                    height: 85,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                      Icons.person,
                                                      size: 45,
                                                      color: Color.fromARGB(
                                                          255, 148, 148, 148),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 20),

                                              // Card representations
                                              Column(
                                                children: [
                                                  // First card - normal
                                                  _buildCardPlaceholder(),

                                                  const SizedBox(height: 10),

                                                  // Second card - with blur effect
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 1.5,
                                                          sigmaY: 1.5),
                                                      child: Opacity(
                                                        opacity: 0.4,
                                                        child:
                                                            _buildCardPlaceholder(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 10),

                                              // Success text
                                              const Text(
                                                'Register Successfully',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )

                                  // Success checkmark positioned at top-right
                                ],
                              ),

                              const Text(
                                'Congratulation! your account already created.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  height: 1.4,
                                ),
                              ),

                              const SizedBox(height: 4),

                              const Text(
                                'lorem ipsume.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.035),

                              // Continue button
                              Container(
                                width: double.infinity,
                                height: 56,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFB148FF), // Purple
                                      Color(0xFFFF6B9D), // Pink
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFB148FF)
                                          .withOpacity(0.3),
                                      blurRadius: 12,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      setState(() {
                                        showSuccessPopup =
                                            false; // Hide the popup
                                      });
                                      // You can add navigation here if needed
                                    },
                                    child: const Center(
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: screenHeight * 0.025),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 9,
                    right: 30,
                    child: Container(
                        width: 58,
                        height: 58,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 27,
                            ))),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, double screenWidth) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontSize: screenWidth * 0.04,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTextField(
    String hintText,
    double screenWidth,
    double screenHeight, {
    int maxLines = 1,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: TextField(
        maxLines: maxLines,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: screenWidth * 0.04,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.018,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(double screenWidth, double screenHeight) {
    return Column(
      children: [
        // Main dropdown button
        GestureDetector(
          onTap: () {
            setState(() {
              showDropdownOptions = !showDropdownOptions;
            });
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.018,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedIndustry ?? '3 Industry',
                  style: TextStyle(
                    color: selectedIndustry != null
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                Icon(
                  showDropdownOptions
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white.withOpacity(0.7),
                  size: screenWidth * 0.06,
                ),
              ],
            ),
          ),
        ),

        // Radio button options (show when dropdown is tapped)
        if (showDropdownOptions)
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.01),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Column(
              children: industries.map((industry) {
                return RadioListTile<String>(
                  title: Text(
                    industry,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  value: industry,
                  groupValue: selectedIndustry,
                  activeColor: const Color(0xFFB148FF),
                  onChanged: (String? value) {
                    setState(() {
                      selectedIndustry = value;
                      showDropdownOptions =
                          false; // Hide options after selection
                    });
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

// Helper widget for card placeholders
Widget _buildCardPlaceholder() {
  return Container(
    width: double.infinity,
    height: 50, // Increased height to accommodate all elements
    padding: const EdgeInsets.only(
      left: 8,
    ),
    decoration: BoxDecoration(
      color: const Color.fromARGB(174, 30, 30, 30).withOpacity(0.2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First row with square and line
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Square box
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius:
                    BorderRadius.circular(8), // Slightly rounded corners
              ),
            ),
            const SizedBox(width: 15), // Reduced spacing
            // First line
            Container(
              width: 100,
              height: 15, // Slightly thicker line
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        // Spacing between rows
      ],
    ),
  );
}

// Add this new method to your _RegistrationPageState class:
void _showSuccessBottomSheet(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5), // Blur effect
            child: Container(
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 136, 135, 135).withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.08),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 280,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(47, 232, 232, 232),
                                    Color.fromARGB(47, 232, 232, 232),
                                    Color.fromARGB(0, 232, 232, 232),
                                  ],
                                  stops: [0.0, 0.5, 1.0],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    // Profile circle
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.person,
                                            size: 45,
                                            color: Color.fromARGB(
                                                255, 148, 148, 148),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 20),

                                    // Card representations
                                    Column(
                                      children: [
                                        _buildCardPlaceholder(),
                                        const SizedBox(height: 10),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 1.5, sigmaY: 1.5),
                                            child: Opacity(
                                              opacity: 0.5,
                                              child: _buildCardPlaceholder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Success text
                                    const Text(
                                      'Register Successfully',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const Text(
                              'Congratulation! your account already created.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              'lorem ipsume.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 30),

                            // Continue button
                            Container(
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFB148FF),
                                    Color(0xFFFF6B9D),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFB148FF)
                                        .withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const homescreenpage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom +
                                        20),
                          ],
                        ),
                        // Checkmark button
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 30,
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
