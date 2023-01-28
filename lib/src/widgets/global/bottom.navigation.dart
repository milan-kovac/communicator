import 'package:communicator/src/pages/calendar.page.dart';
import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/learning.page.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/utils/router.helper.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int pageIndex;
  const BottomNavigation({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value)  {
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
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: pageIndex,
      selectedItemColor: AppColors.darkPurple,
      unselectedItemColor: AppColors.gray,
      backgroundColor: Colors.white,
      items:  [
        BottomNavigationBarItem(
         icon: Image.asset('assets/images/calendar.png', width: 40, color: pageIndex == 0 ? AppColors.darkPurple : Colors.black,),
          label: '',
        ),
        BottomNavigationBarItem(
        icon: Image.asset('assets/images/home.png', width: 40, color: pageIndex == 1 ? AppColors.darkPurple : Colors.black,),
        label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/book.png', width: 40, color: pageIndex == 2 ? AppColors.darkPurple : Colors.black,),
          label: '',
        ),
      ],
    );
  }
}
