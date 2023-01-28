import 'package:communicator/src/pages/intro.page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Communicator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         fontFamily: GoogleFonts.robotoSlab().fontFamily
      ),
      home: IntroPage()
    );
  }
}
