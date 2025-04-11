import 'package:agri/pages/about_page.dart';
import 'package:agri/pages/contact_page.dart';
import 'package:agri/pages/education_page.dart';
import 'package:agri/pages/home_page.dart';
import 'package:agri/pages/product_page.dart';
import 'package:agri/pages/signup_page.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProductPage(),
    EducationPage(),
    AboutPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar:
          true, // This makes the body extend behind the app bar
      body: Stack(
        children: [
          // This will be the background that extends behind the navigation bar
          Positioned.fill(
            child: _pages[_currentIndex],
          ),
          // Custom navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(
                0.6,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: MediaQuery.of(context).size.width * 0.07,
                  ),
                  const Spacer(),
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () => setState(() => _currentIndex = i),
                        onHover: (hovering) => setState(() {}),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: _currentIndex == i
                                ? Colors.green.shade500.withOpacity(
                                    0.7) // Slightly transparent green
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            [
                              'Home',
                              'Products',
                              'Education',
                              'About',
                              'Contact'
                            ][i],
                            style: TextStyle(
                              color:
                                  Colors.white, // Set text color to be visible
                              fontWeight: _currentIndex == i
                                  ? FontWeight.bold
                                  : FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle sign up action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.withOpacity(0.7),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
