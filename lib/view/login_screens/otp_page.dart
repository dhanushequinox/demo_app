import 'package:flutter/material.dart';
import 'package:lorem_ipsum/repositories/widgets/widget_bagournd.dart';
import 'package:lorem_ipsum/view/login_screens/mobile_number_page.dart';
import 'package:lorem_ipsum/view/login_screens/registration_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  bool isOtpComplete = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to all controllers to check OTP completion
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].addListener(_checkOtpCompletion);
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _checkOtpCompletion() {
    bool allFilled =
        controllers.every((controller) => controller.text.isNotEmpty);
    if (allFilled != isOtpComplete) {
      setState(() {
        isOtpComplete = allFilled;
      });
    }
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 414;

    return Scaffold(
      body: createBackgroundWithPinkCorners(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06, // 6% of screen width
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.025), // 2.5% of screen height
                // Back button
                Container(
                  width: screenWidth * 0.12, // 12% of screen width
                  height: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(screenWidth * 0.06),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MobileNumberPage()));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: screenWidth * 0.06, // 6% of screen width
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                // Title
                Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: isSmallScreen
                        ? 24
                        : isMediumScreen
                            ? 26
                            : 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                // Subtitle with phone number
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(
                          text:
                              'We have sent the code verification to\nyour number '),
                      WidgetSpan(
                        child: Container(
                          width: screenWidth * 0.03, // 3% of screen width
                          height: screenWidth * 0.03,
                          margin: EdgeInsets.only(right: screenWidth * 0.01),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '+91 782 933 8977',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: isSmallScreen ? 14 : 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.075), // 7.5% of screen height
                // OTP input boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 66,
                      height: 59,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.05),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(
                          fontSize: isSmallScreen
                              ? 20
                              : isMediumScreen
                                  ? 22
                                  : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => _onChanged(value, index),
                      ),
                    );
                  }),
                ),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                // Timer
                Center(
                  child: Text(
                    '02:50',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06), // 6% of screen height
                // Submit button
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.07, // 7% of screen height
                  margin: EdgeInsets.only(bottom: screenHeight * 0.025),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isOtpComplete
                          ? [
                              const Color(0xFF8B5CF6),
                              const Color(0xFFEC4899),
                            ]
                          : [
                              const Color(0xFF8B5CF6).withOpacity(0.4),
                              const Color(0xFFEC4899).withOpacity(0.4),
                            ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: isOtpComplete
                        ? () {
                            // Handle submit
                            String otp = controllers
                                .map((controller) => controller.text)
                                .join();
                            print('OTP entered: $otp');
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegistrationPage()));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      disabledBackgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        fontWeight: FontWeight.w600,
                        color: isOtpComplete ? Colors.white : Colors.white60,
                      ),
                    ),
                  ),
                ),
                // Resend text
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        color: Colors.white70,
                      ),
                      children: [
                        const TextSpan(text: "Didn't receive the code? "),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              
                              // Handle resend
                              print('Resend code tapped');
                            },
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 14 : 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
              ],
            ),
          ),
        ),
      ),
    );
  }
}
