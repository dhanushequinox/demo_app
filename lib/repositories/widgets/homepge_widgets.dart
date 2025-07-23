import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class YourCarouselWidget extends StatefulWidget {
  const YourCarouselWidget({super.key});

  @override
  State<YourCarouselWidget> createState() => _YourCarouselWidgetState();
}

class _YourCarouselWidgetState extends State<YourCarouselWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

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
                color: index == _currentIndex ? Colors.purple : Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class CarouselCardSlider extends StatefulWidget {
  const CarouselCardSlider({super.key});

  @override
  State<CarouselCardSlider> createState() => _CarouselCardSliderState();
}

class _CarouselCardSliderState extends State<CarouselCardSlider> {
  int _currentIndex = 0;

  final List<Widget> _cards = List.generate(
    5,
    (index) => buildProductCard(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _cards,
          options: CarouselOptions(
            height: 420,
            enableInfiniteScroll: false,
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),

        // Purple line indicator
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _cards.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 4,
                width: _currentIndex == index ? 24 : 12,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.purple
                      : const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildProductCard() {
  return Container(
    width: 327,
    height: 420,
    margin: const EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Top Header Row
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                    'asset/images/e2a19f6c3703d77a2d3aa15f9f463df004cf93e5.jpg'),
              ),
              SizedBox(width: 8),
              Text(
                '#230942944',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Spacer(),
              Text(
                'Designation',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),

        /// Main Image Section with Play Icon
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'asset/images/94341ecca340144ef81f84037e950da926b71b78.jpg',
                  height: 355,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned.fill(
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const Positioned(
                bottom: 55,
                right: 20,
                child: Column(
                  children: [
                    /// Share Icon
                    Icon(
                      Icons.ios_share,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),

                    /// Heart Icon
                    Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                )),

            /// Bottom overlay section with icons & text
            Positioned(
              bottom: 0,
              left: 15,
              right: 15,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: const Row(
                  children: [
                    /// Video title and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABC Videos',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '₹3000',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    SizedBox(width: 10),

                    /// Rating with star
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4.6',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

class CarouselCardSlidersecond extends StatefulWidget {
  const CarouselCardSlidersecond({super.key});

  @override
  State<CarouselCardSlidersecond> createState() =>
      _CarouselCardSlidersecondState();
}

class _CarouselCardSlidersecondState extends State<CarouselCardSlidersecond> {
  int _currentIndex = 0;

  final List<Widget> _cards = List.generate(
    5,
    (index) => buildSecondProductCard(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _cards,
          options: CarouselOptions(
            height: 420,
            enableInfiniteScroll: false,
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),

        // Purple line indicator
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _cards.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 4,
                width: _currentIndex == index ? 24 : 12,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.purple
                      : const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildSecondProductCard() {
  return Container(
    width: 327,
    height: 420,
    margin: const EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Header Row
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                    'asset/images/e2a19f6c3703d77a2d3aa15f9f463df004cf93e5.jpg'),
              ),
              SizedBox(width: 8),
              Text(
                '#230942944',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Spacer(),
              Text(
                'Designation',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),

        // Main Image Section with Play Icon
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'asset/images99b2f4a035bfc8565a849238a8a46baae9603405.jpg', // NEW IMAGE
                  height: 355,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned.fill(
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const Positioned(
              bottom: 55,
              right: 20,
              child: Column(children: [
                Icon(Icons.ios_share, size: 18, color: Colors.white),
                SizedBox(height: 10),
                Icon(Icons.favorite_border, size: 18, color: Colors.white),
              ]),
            ),
            Positioned(
              bottom: 0,
              left: 15,
              right: 15,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABC Videos',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '₹3000',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4.6',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
