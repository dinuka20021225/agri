import 'package:agri/widget/hover_zoom_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> galleryImages = [
      "assets/galery/g1.jpg",
      "assets/galery/g2.jpg",
      "assets/galery/g3.jpg",
      "assets/galery/g4.jpg",
      "assets/galery/g5.jpg",
      "assets/galery/g6.jpg",
      "assets/galery/g7.jpg",
      "assets/galery/g8.jpg",
      "assets/galery/g9.jpg",
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Gallery",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
              child: MasonryGridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: galleryImages.length,
                itemBuilder: (context, index) {
                  return HoverZoomEffect(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        galleryImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
