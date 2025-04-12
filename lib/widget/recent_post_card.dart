import 'package:agri/widget/hover_zoom_effect.dart';
import 'package:flutter/material.dart';

class RecentPostCard extends StatelessWidget {
  const RecentPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade50,
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Posts",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            containerCard(
              "Climate-Resilient Agricultural Systems",
              "12 ,January, 2024",
              "assets/topics/climate.jpg",
              context,
            ),
            SizedBox(
              height: 20,
            ),
            containerCard(
              "Farmer Education & Comprehensive Resource Networks",
              "22 ,January, 2025",
              "assets/topics/education.jpg",
              context,
            ),
            SizedBox(
              height: 20,
            ),
            containerCard(
              "Comprehensive Crop Management Strategies",
              "13 ,March, 2025",
              "assets/topics/crop.jpg",
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget containerCard(String cardTopic, String cardDate, String cardImagePath,
      BuildContext context) {
    return HoverZoomEffect(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.27,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  cardImagePath,
                  width: MediaQuery.of(context).size.width * 0.06,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      cardDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      cardTopic,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
