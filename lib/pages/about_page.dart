import 'package:agri/widget/animated_fade_slide.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 40, right: 40, bottom: 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// About text
                            AnimatedFadeSlide(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedFadeSlide(
                                      delay: const Duration(milliseconds: 1),
                                      child: Text(
                                        "About Us",
                                        style: TextStyle(
                                          fontSize: 64,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    AnimatedFadeSlide(
                                      delay: const Duration(milliseconds: 200),
                                      child: Divider(
                                        color: Colors.black,
                                        thickness: 2,
                                        height: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    AnimatedFadeSlide(
                                      delay: const Duration(milliseconds: 1000),
                                      child: Text(
                                        "At our core, we believe farmers deserve direct access to knowledge and markets—without middlemen or confusion. Our platform empowers farmers by providing up-to-date agricultural information, expert tips, and climate-smart practices, all in one easy-to-use space. More than that, we give farmers the freedom to sell their produce directly to buyers, ensuring fair prices and transparent transactions. We're here to support every step of the farming journey—helping you grow smarter, sell easier, and thrive together.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),

                            /// Lottie animation
                            AnimatedFadeSlide(
                              delay: const Duration(milliseconds: 1200),
                              child: Lottie.asset(
                                "assets/about.json",
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FooterSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
