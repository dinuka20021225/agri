import 'package:agri/widget/hover_effect.dart';
import 'package:flutter/material.dart';

class KeyPointCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  const KeyPointCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            HoverZoomImage(
              imagePath: imagePath,
              width: MediaQuery.of(context).size.width * 0.06,
              fit: 'contain',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
