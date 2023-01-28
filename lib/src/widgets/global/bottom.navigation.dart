import 'package:communicator/src/pages/calendar.page.dart';
import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/learning.page.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/utils/router.helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final int pageIndex;
  const BottomNavigation({super.key, required this.pageIndex});
  @override
  Widget build(BuildContext context) {

  void onTap(value)  {
    switch (value) {
      case 0:
      RouterHelper(context: context, where: const CalendarPage()).goFadeAway();
      break;
      case 1:
      RouterHelper(context: context, where: const HomePage()).goFadeAway();
      break;
      case 2:
      RouterHelper(context: context, where: const LearningPage()).goFadeAway();
      break;
    }
  }
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: (() => onTap(0)),
              child: Container(
                 height: 50,
                color: pageIndex == 0 ? Colors.white : AppColors.fadedBlack,
                child: Icon(FontAwesomeIcons.calendar,
                    size: 30,
                    color: pageIndex == 0 ? AppColors.fadedBlack : Colors.white),
              ),
            ),
          ),
           Expanded(
            flex: 3,
             child: GestureDetector(
               onTap: (() => onTap(1)),
               child: Container(
                height: 50,
                color: pageIndex == 1 ? Colors.white : AppColors.fadedBlack,
                child: Icon(FontAwesomeIcons.star,
                    size: 30,
                    color: pageIndex == 1 ? AppColors.fadedBlack : Colors.white),
                       ),
             ),
           ),
           Expanded(
            flex: 3,
             child: GestureDetector(
               onTap: (() => onTap(2)),
               child: Container(
                height: 50,
                color: pageIndex == 2 ? Colors.white : AppColors.fadedBlack,
                child: Icon(FontAwesomeIcons.brain,
                    size: 30,
                    color: pageIndex == 2 ? AppColors.fadedBlack: Colors.white),
                       ),
             ),
           )
        ],
      ),
    );
  }
}
