import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/repositories/widgets/widget_bagournd.dart';
import 'package:lorem_ipsum/view/login_screens/mobile_number_page.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    final scrensize = MediaQuery.of(context).size;
    return Scaffold(
      body: createBackgroundWithPinkCorners(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            // Title and subtitle
            Center(
                child: Text(
              'Create a Inspire A Videos',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            )),
            SizedBox(height: 10),
            Center(
                child: Text(
              'Login with ABC or DCD',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )),

            SizedBox(height: 40),

            // Images section
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: scrensize.height * 0.05,
                    right: scrensize.height * 0.003,
                    child: Container(
                      height: 256,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'asset/images/Group 1171274916.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: scrensize.height * 0.2,
                    right: 0.1,
                    child: Container(
                      height: 236,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'asset/images/Group 1171274915.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
             Positioned(
                    top: scrensize.height * 0.31,
                    right: -3,
                    child: Container(
                      height: 286,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'asset/images/Group 1171274914.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 140,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                    
                  Positioned(
                    bottom: -2,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          // ABC Button
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF9C3FE4), // #9C3FE4
                                  Color(0xFFC65647), // #C65647
                                ],
                              ),
                                  boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(0, 5),
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MobileNumberPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'ABC',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 16),

                          // DCD Button
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MobileNumberPage()));
                                // Handle DCD login
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'DCD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                  // Third image (bottom)
                ],
              ),
            ),

            // Buttons section
          ],
        ),
      ),
    );
  }
}