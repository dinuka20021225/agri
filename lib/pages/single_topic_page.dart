import 'package:agri/widget/comment_box.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:agri/widget/gallery_card.dart';
import 'package:agri/widget/recent_post_card.dart';
import 'package:flutter/material.dart';

class SingleTopicPage extends StatelessWidget {
  final String topic;
  final String imagePath;
  final String description;
  final String day;
  final String yearMonth;
  const SingleTopicPage({
    super.key,
    required this.topic,
    required this.imagePath,
    required this.description,
    required this.day,
    required this.yearMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 60, left: 120, right: 120, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imagePath,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(0),
                                  ),
                                  color: Colors.green,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(
                                        day,
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        yearMonth,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          // -------------- Admin and comment -------------
                          Row(
                            children: [
                              Icon(
                                Icons.person_outlined,
                                color: Colors.green,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Admin",
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.comment_outlined,
                                color: Colors.green,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "26 Comments",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.5,
                              //maxHeight: MediaQuery.of(context).size.width * 1,
                            ),
                            child: Text(
                              description,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommentBox(),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Column(
                        children: [
                          RecentPostCard(),
                          SizedBox(
                            height: 30,
                          ),
                          GalleryCard(),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
