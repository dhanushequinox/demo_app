import 'dart:ui';

import 'package:flutter/material.dart';

Widget createBackgroundWithPinkCorners({required Widget child}) {
  return Container(
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
                bottomRight: Radius.circular(100)
              ),
            ),
          ),
        ),
       // Pink container in bottom left corner
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     decoration: const BoxDecoration(
        //       color: Color(0xFFD02E76), // Pink color
        //       borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(100),
        //       ),
        //     ),
        //   ),
        // ),
        // // Blur overlay
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 170, sigmaY: 170),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        // Your content here
        child,
      ],
    ),
  );
}