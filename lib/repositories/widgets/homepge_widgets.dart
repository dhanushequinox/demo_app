import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class YourCarouselWidget extends StatefulWidget {
  const YourCarouselWidget({super.key});

  @override
  State<YourCarouselWidget> createState() => _YourCarouselWidgetState();
}

class _YourCarouselWidgetState extends State<YourCarouselWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  Widget _buildFeaturedCameraVideo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black87,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Image.asset(
                    'asset/images/Screenshot 2025-07-23 164843.png'),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: const Text(
                  'Create Your Stunning Ideas into Real Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Video Creation.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 240,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [
            _buildFeaturedCameraVideo(),
            _buildFeaturedCameraVideo(),
            _buildFeaturedCameraVideo(),
          ],
        ),

        /// ✅ Custom indicator BELOW container, not inside
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: index == _currentIndex ? 30 : 6,
              height: 3,
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ? Colors.purple
                    : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ],
    );
  }
}
