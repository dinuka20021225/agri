import 'package:agri/widget/animated_fade_slide.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                            top: 150, left: 40, right: 40, bottom: 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Lottie animation
                            AnimatedFadeSlide(
                              delay: const Duration(milliseconds: 500),
                              child: Lottie.asset(
                                "assets/contact.json",
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                fit: BoxFit.fill,
                              ),
                            ),

                            /// Contact form
                            Expanded(
                              child: AnimatedFadeSlide(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AnimatedFadeSlide(
                                        delay: const Duration(milliseconds: 1),
                                        child: Text(
                                          "Contact Us",
                                          style: TextStyle(
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      AnimatedFadeSlide(
                                        delay:
                                            const Duration(milliseconds: 800),
                                        child: Divider(
                                          color: Colors.black,
                                          thickness: 2,
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      AnimatedFadeSlide(
                                        delay:
                                            const Duration(milliseconds: 1000),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "If you have any questions or feedback, feel free to contact us.",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Your Email',
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 2),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              cursorColor: Colors.black,
                                              maxLines: 5,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText:
                                                    'Type your message here...',
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 2),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black,
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                "Send",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
