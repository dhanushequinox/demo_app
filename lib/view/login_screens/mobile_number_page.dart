import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lorem_ipsum/repositories/widgets/widget_bagournd.dart';
import 'package:lorem_ipsum/view/login_screens/otp_page.dart';

class MobileNumberPage extends StatefulWidget {
  const MobileNumberPage({super.key});

  @override
  State<MobileNumberPage> createState() => _MobileNumberPageState();
}

class _MobileNumberPageState extends State<MobileNumberPage> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_onPhoneNumberChanged);
  }

  void _onPhoneNumberChanged() {
    setState(() {
      _isButtonEnabled = _phoneController.text.length == 10;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: createBackgroundWithPinkCorners(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: 40),

                // Image section - aligned to left (top area)
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 378,
                        width: 235,
                        child: Image.asset(
                          'asset/images/Saly-14.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

                // Number-related content section - at bottom area
                Container(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'Login With Your Mobile Number',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 10),

                      // Subtitle
                      Text(
                        'Lorem Ipsum is simply dummy text',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 30),

                      // Phone number input field
                      Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '+81',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Container(
                                width: 1,
                                height: 24,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your number',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 16,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      // Continue Button - FIXED ALIGNMENT
                      GestureDetector(
                        onTap: _isButtonEnabled
                            ? () {
                              
                                // Navigate to next page
                                print('Navigate to OTP verification page');
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpPage()));
                              }
                            : null,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-1.0, 0.0),
                              end: Alignment(1.0, 0.0),
                              colors: _isButtonEnabled
                                  ? [
                                      Color(0xFF9C3FE4),
                                      Color(0xFFC65647),
                                    ]
                                  : [
                                      Color(0xFF9C3FE4).withOpacity(0.3),
                                      Color(0xFFC65647).withOpacity(0.3),
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: _isButtonEnabled
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: Offset(0, 4),
                                      blurRadius: 8,
                                      spreadRadius: 0,
                                    ),
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                color: _isButtonEnabled
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
      ),
    );
  }
}
