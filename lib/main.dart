import 'package:agri/widget/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Navigation',
      theme: ThemeData(
          inputDecorationTheme:
              InputDecorationTheme(hoverColor: Colors.transparent),
          textTheme: GoogleFonts.poppinsTextTheme(),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.transparent,
            selectionHandleColor: Colors.transparent,
          )),
      home: const CustomNavbar(),
    );
  }
}
