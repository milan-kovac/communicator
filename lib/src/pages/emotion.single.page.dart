import 'package:flutter/material.dart';

class EmotionSinglePage extends StatelessWidget {
  final dynamic emotion;
  const EmotionSinglePage({super.key, required this.emotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Hero(
        tag: emotion['id'],
        child: Center(
          child: Image.asset(emotion['image']),
        ),
      ),
    );
  }
}
