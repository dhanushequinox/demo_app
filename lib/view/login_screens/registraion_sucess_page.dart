import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:lorem_ipsum/repositories/widgets/widget_bagournd.dart';

class RegistrationSuccessPage extends StatefulWidget {
  const RegistrationSuccessPage({super.key});

  @override
  State<RegistrationSuccessPage> createState() => _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: createBackgroundWithPinkCorners(
        child: Stack(
          children: [
            // Background Registration Form (Blurred)
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.08),
                    
                    // Registration title
                    const Text(
                      'Registration',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Full Name field
                    const Text(
                      'Full Name',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: const TextField(
                        enabled: false,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(color: Colors.white54),
                          prefixIcon: Icon(Icons.person_outline, color: Colors.white54),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Company Name field
                    const Text(
                      'Company Name',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: const TextField(
                        enabled: false,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          hintText: 'Enter company name',
                          hintStyle: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Heavy Blur overlay to make background less visible
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            
            // Success Popup at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.08),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile icon with success checkmark
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Main profile circle
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white70,
                            ),
                          ),
                          
                          // Success checkmark positioned at top-right
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: screenHeight * 0.025),
                      
                      // Card representation
                      Container(
                        width: double.infinity,
                        height: 75,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Top bar
                            Container(
                              width: 70,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Bottom bar
                            Container(
                              width: 100,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: screenHeight * 0.035),
                      
                      // Success text
                      const Text(
                        'Register Successfully',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      
                      SizedBox(height: screenHeight * 0.015),
                      
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
                              color: const Color(0xFFB148FF).withOpacity(0.3),
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
                              // Navigate to next screen or pop
                              Navigator.pop(context);
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}