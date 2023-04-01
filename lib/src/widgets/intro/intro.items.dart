import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class IntroItems extends StatelessWidget {
  IntroItems({super.key});
  List<String> items = ['Edukacija', 'Planiranje', 'Podrška'];
  List<String> icons = ['assets/images/education.png', 'assets/images/calendar.png', 'assets/images/support.png'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++)
            ListTile(
              title: Text(
                items[i],
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
