import 'package:flutter/material.dart';

class StarRatings extends StatelessWidget {
  const StarRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => const Icon(Icons.star, color: Colors.amber),
      ),
    );
  }
}