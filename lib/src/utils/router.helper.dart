import 'package:flutter/material.dart';
class RouterHelper {
  BuildContext context;
  Widget where;

  RouterHelper({required this.context, required this.where});

  void goFadeAway() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => where,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
