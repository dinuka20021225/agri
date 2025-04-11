import 'dart:async';
import 'package:agri/widget/customer_review_card.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:agri/widget/star_ratings.dart';
import 'package:agri/widget/suggested_product_card.dart';
import 'package:agri/widget/write_review_card.dart';
import 'package:flutter/material.dart';
import 'package:agri/widget/quantity_box.dart';

class SingleProductPage extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final double price;
  final String location;

  const SingleProductPage({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.location,
  });

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  final ScrollController scrollController = ScrollController();
  late final PageController _pageController;
  int _currentPage = 0;
  late final List<Widget> _reviewCards;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _reviewCards = [
      CustomerReviewCard(
        name: "Dinuka Akalanka",
        review: "Amazing quality! Will buy again.",
        rating: 5,
        date: 'April 10, 2025',
      ),
      CustomerReviewCard(
        name: "lisan Nenuka",
        review: "Fast delivery and fresh items.",
        rating: 4,
        date: 'May 2, 2025',
        imageUrl: "assets/Users/user 3.jpeg",
      ),
      CustomerReviewCard(
        name: "Nisansala Vidumina",
        review: "Pretty good, but the packaging could improve.",
        rating: 3,
        date: 'April 1, 2025',
        imageUrl: 'assets/Users/user 2.jpg',
      ),
      CustomerReviewCard(
        name: "Thilina",
        review: "Very satisfied with the purchase!",
        rating: 5,
        date: 'January 19, 2025',
      ),
      CustomerReviewCard(
        name: "Ishara",
        review: "Not bad, but price is a bit high.",
        rating: 4,
        date: 'December 28, 2024',
        imageUrl: 'assets/Users/istockphoto-502897614-612x612.jpg',
      ),
    ];

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _reviewCards.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Rs. ${widget.price}",
                          style:
                              TextStyle(fontSize: 22, color: Colors.green[700]),
                        ),
                        const SizedBox(height: 10),
                        const StarRatings(),
                        const SizedBox(height: 10),
                        const QuantityBox(),
                        const SizedBox(height: 20),
                        Text(
                          widget.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.red),
                            const SizedBox(width: 5),
                            Text(widget.location,
                                style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Shipping Section
                        Row(
                          children: [
                            Text(
                              "Shipping",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.local_shipping,
                              size:
                                  MediaQuery.of(context).size.aspectRatio * 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "We offer fast and reliable shipping across Sri Lanka, so you can expect your order to arrive within 2 to 4 business days no matter where you are—from Colombo to the hill country and beyond! Once your package is dispatched, we’ll send you a tracking number so you can keep an eye on its journey right to your doorstep. We partner with trusted local couriers and make sure every item is carefully packed using eco-friendly materials whenever possible. If you have any questions or special delivery requests, feel free to reach out—we’re always happy to help!",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 80, right: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "You Might Also Like",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Stack(
                      children: [
                        ListView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            SuggestedProductCard(
                                image: 'assets/fruites/mango.jpg',
                                name: 'Mango (Amba)',
                                price: 450.00),
                            SuggestedProductCard(
                                image: 'assets/rice/keeri-samba.jpg',
                                name: 'Keeri Samba',
                                price: 130.00),
                            SuggestedProductCard(
                                image: 'assets/vegi/pumpkin.jpg',
                                name: 'Pumpkin (Vattakka)',
                                price: 180.00),
                            SuggestedProductCard(
                                image: 'assets/fruites/mangosteen.jpg',
                                name: 'Mangusteen',
                                price: 600.00),
                            SuggestedProductCard(
                                image: 'assets/fruites/rambutan.jpg',
                                name: 'Rambutan',
                                price: 500.00),
                            SuggestedProductCard(
                                image: 'assets/rice/nadu.jpg',
                                name: 'Nadu',
                                price: 120.00),
                          ],
                        ),
                        Positioned(
                          left: 0,
                          top: 100,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(Icons.arrow_back_ios,
                                size: 30, color: Colors.white),
                            onPressed: () {
                              scrollController.animateTo(
                                scrollController.offset - 220,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 100,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(Icons.arrow_forward_ios,
                                size: 30, color: Colors.white),
                            onPressed: () {
                              scrollController.animateTo(
                                scrollController.offset + 220,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "What Our Customers Say",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _reviewCards.length,
                      itemBuilder: (context, index) => _reviewCards[index],
                    ),
                  ),
                  const SizedBox(height: 40),
                  WriteReviewCard(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
