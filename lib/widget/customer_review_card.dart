import 'package:flutter/material.dart';

class CustomerReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final int rating;
  final String date;
  final String? imageUrl;

  const CustomerReviewCard({
    super.key,
    required this.name,
    required this.review,
    required this.rating,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.3,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Avatar, Name and Rating
            Row(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      imageUrl != null ? NetworkImage(imageUrl!) : null,
                  backgroundColor: Colors.green.shade100,
                  child: imageUrl == null
                      ? Text(
                          name.isNotEmpty ? name[0] : '?',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : null,
                ),
                const SizedBox(width: 12),

                // Name + Date + Stars
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Review Text
            Text(
              review,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
