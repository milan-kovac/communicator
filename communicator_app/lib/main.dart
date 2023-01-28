import 'dart:io';

import 'package:communicator_app/pages/home.page.dart';
import 'package:communicator_app/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // #Fullscreen config
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // #No rotate screan config
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Communiactor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
