import 'package:agri/widget/footer_section.dart';
import 'package:agri/widget/star_ratings.dart';
import 'package:flutter/material.dart';
import 'package:agri/widget/quantity_box.dart';

class SingleProductPage extends StatelessWidget {
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
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 40),

                  // Product Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Rs. $price",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.green[700],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const StarRatings(),
                        const SizedBox(height: 10),
                        const QuantityBox(),
                        const SizedBox(height: 20),
                        Text(
                          description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              location,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
