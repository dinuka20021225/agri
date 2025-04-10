import 'package:agri/widget/Featured_produce_card.dart';
import 'package:agri/widget/animated_fade_slide.dart';
import 'package:agri/widget/farmers_guid_card.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:agri/widget/hover_effect.dart';
import 'package:agri/widget/key_point_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageList = [
    'assets/ChatGPT Image Apr 6, 2025, 12_58_14 PM.png',
    'assets/pexels-dinukagunawardana-17903072.jpg',
    'assets/pexels-dinukagunawardana-17903073.jpg',
    'assets/pexels-gosv-745425.jpg',
    'assets/pexels-wendywei-1656663.jpg',
  ];

  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section with carousel slider
                SizedBox(
                  height: constraints.maxHeight * 0.8,
                  child: Stack(
                    children: [
                      // Carousel Slider
                      Positioned.fill(
                        child: CarouselSlider(
                          items: imageList.map((imagePath) {
                            return Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            );
                          }).toList(),
                          carouselController: _carouselController,
                          options: CarouselOptions(
                            height: constraints.maxHeight * 0.8,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                      // Gradient overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Content
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedFadeSlide(
                                duration: const Duration(milliseconds: 1000),
                                child: Text(
                                  "Welcome to Organic",
                                  style: TextStyle(
                                    fontSize:
                                        constraints.maxWidth < 600 ? 36 : 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 20),
                              AnimatedFadeSlide(
                                duration: const Duration(milliseconds: 500),
                                child: Text(
                                  "Common Place for all your agricultural needs",
                                  style: TextStyle(
                                    fontSize:
                                        constraints.maxWidth < 600 ? 18 : 24,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  "Join Now",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Indicator dots
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    imageList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => _carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(
                                            _currentIndex == entry.key
                                                ? 0.9
                                                : 0.4),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Key Points Section
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      KeyPointCard(
                        imagePath: "assets/tractor_1194981.png",
                        title: "100% farmer-owned",
                        subTitle: "Direct from farms",
                      ),
                      KeyPointCard(
                        imagePath: "assets/shopping-basket_6729689.png",
                        title: "Organic produce",
                        subTitle: "Quality assurance guaranteed",
                      ),
                      KeyPointCard(
                        imagePath: "assets/truck_4394703.png",
                        title: "Express shipping",
                        subTitle: "Speedy delivery",
                      ),
                      KeyPointCard(
                        imagePath: "assets/recycling_2964213.png",
                        title: "Real-time updates",
                        subTitle: "Stay informed on your orders",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                // Featured Produce Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Featured produce",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text("View all"),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FeaturedProduceCard(
                      imageUrl: "assets/rice.jpg",
                      title: "Rice",
                      buttonText: "info",
                    ),
                    FeaturedProduceCard(
                      imageUrl: "assets/vegi.jpg",
                      title: "Vegitables",
                      buttonText: "info",
                    ),
                    FeaturedProduceCard(
                      imageUrl: "assets/fruites.jpg",
                      title: "Fruits",
                      buttonText: "info",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FeaturedProduceCard(
                      imageUrl: "assets/farming.jpg",
                      title: "Sustainable farming tips",
                      buttonText: "Learn more",
                    ),
                    FeaturedProduceCard(
                      imageUrl: "assets/crop.jpg",
                      title: "Organic crop solutions",
                      buttonText: "Learn more",
                    ),
                    FeaturedProduceCard(
                      imageUrl: "assets/harvesting.jpg",
                      title: "Harvesting techniques",
                      buttonText: "Learn more",
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                // Farmers' Guide Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Farmers' Guide",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FarmersGuidCard(
                            imageUrl: "assets/find.png",
                            title: "Find your market",
                            subTitle: "Sell directly to consumers",
                            pageNumber: "01.",
                          ),
                          FarmersGuidCard(
                            imageUrl: "assets/sell.png",
                            title: "Sell Produce",
                            subTitle: "Direct from farm to table",
                            pageNumber: "02.",
                          ),
                          FarmersGuidCard(
                            imageUrl: "assets/delivery.png",
                            title: "Direct Delivery Service",
                            subTitle: "Farm-fresh produce at your doorstep",
                            pageNumber: "03.",
                          ),
                          FarmersGuidCard(
                            imageUrl: "assets/enjoy.png",
                            title: "Enjoy the Harvest",
                            subTitle: "Share your farming experience",
                            pageNumber: "04.",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                // Get the App Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Get the Organic App for farming and selling!",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Connect with buyers and sell crops with ease!",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.4,
                            ),
                            child: Text(
                              "Empower your farm with technology! Access expert farming tips, manage your crops, and connect directly with buyers to sell your produce faster, easier, and without middlemen.Download now and start growing smarter, selling better!",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            children: [
                              HoverZoomImage(
                                imagePath: "assets/google.png",
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              HoverZoomImage(
                                imagePath: "assets/apple.png",
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                            ],
                          )
                        ],
                      ),
                      LottieBuilder.asset(
                        "assets/anim.json",
                        width: MediaQuery.of(context).size.width * 0.4,
                        //height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                        repeat: true,
                        frameRate: FrameRate.max,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                FooterSection()
              ],
            ),
          );
        },
      ),
    );
  }
}
