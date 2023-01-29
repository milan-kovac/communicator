import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/intro.page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
         fontFamily: GoogleFonts.rubik().fontFamily
      ),
      home: IntroPage()
    );
  }
}
