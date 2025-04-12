import 'package:agri/data/topic_data.dart';
import 'package:agri/pages/single_topic_page.dart';
import 'package:agri/widget/animated_fade_slide.dart';
import 'package:agri/widget/hover_zoom_effect.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final topics = topicData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 110, left: 120, right: 120, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedFadeSlide(
                    child: Text(
                      "Topics",
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AnimatedFadeSlide(
                    delay: Duration(microseconds: 1),
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MasonryGridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 60,
                    crossAxisSpacing: 60,
                    itemCount: topics.length + 1, // +1 for the new container
                    itemBuilder: (context, index) {
                      // If this is the last index, show the "Stay tuned" container
                      if (index == topics.length) {
                        return AnimatedFadeSlide(
                          delay: Duration(milliseconds: 100 * index),
                          child: HoverZoomEffect(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                    offset: Offset(4, 4),
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 8,
                                    offset: Offset(-4, -4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LottieBuilder.asset(
                                      "assets/stay_tuned.json",
                                      //width: MediaQuery.of(context).size.width *
                                      //0.2,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Stay tuned!",
                                      style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "We're updating more topics",
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 28,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      // Otherwise show normal topic card
                      return AnimatedFadeSlide(
                        delay: Duration(milliseconds: 100 * index),
                        child: HoverZoomEffect(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(4, 4),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 8,
                                  offset: Offset(-4, -4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Image.asset(
                                    topics[index].imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        topics[index].topic,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SingleTopicPage(
                                                topic: topics[index].topic,
                                                imagePath:
                                                    topics[index].imagePath,
                                                description:
                                                    topics[index].description,
                                                day: topics[index].day,
                                                yearMonth:
                                                    topics[index].yearMonth,
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          minimumSize:
                                              Size(double.infinity, 36),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          "Learn more",
                                          style: TextStyle(color: Colors.white),
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
                    },
                  )
                ],
              ),
            ),
            FooterSection()
          ],
        ),
      ),
    );
  }
}
