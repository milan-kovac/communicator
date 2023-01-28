import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouterHelper {
  BuildContext context;
  Widget where;

  RouterHelper({required this.context, required this.where});

  void goFadeAway() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        alignment: Alignment.topCenter,
        child: where,
      ),
    );
  }
}
