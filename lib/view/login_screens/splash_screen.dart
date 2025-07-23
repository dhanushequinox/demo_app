import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:lorem_ipsum/view/login_screens/starting_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF1B1919), // Base background color
        child: Stack(
          children: [
            // Pink container in top right corner
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 170,
                height: 170,
                decoration: const BoxDecoration(
                  color: Color(0xFFD02E76), // Pink color
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                ),
              ),
            ),
            // Pink container in bottom left corner
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 170,
                height: 170,
                decoration: const BoxDecoration(
                  color: Color(0xFFD02E76), // Pink color
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(100)),
                ),
              ),
            ),
            // Blur overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 170, sigmaY: 170),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            // Centered logo
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'asset/images/image 1.png', // Updated path without space
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigation() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const StartingPage()),
    );
  }
}
