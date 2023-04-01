import 'package:communicator/src/pages/body.page.dart';
import 'package:communicator/src/pages/emotions.page.dart';
import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/learning.page.dart';
import 'package:communicator/src/pages/settings.page.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pages/calendar.page.dart';
import '../../utils/router.helper.dart';

class Sidebar extends StatelessWidget {
  final int currentPageIndex;
  Sidebar({super.key, required this.currentPageIndex});
  List<String> items = ['Početak', 'Kalendar', 'Učenje', 'Emocije', 'Telo', 'Podešavanja'];
  List<Widget> pages = [const HomePage(), const CalendarPage(), const LearningPage(), const EmotionsPage(), const BodyPage(), const SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      width: 180.w,
      elevation: 2,
      child: Column(
        children: [
          SizedBox(
            height: 250.h,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/autism.png',
                height: 120.h,
                width: 120.w,
              ),
            ),
          ),
          Expanded(
            child: Column(children: [
              for (var i = 0; i < items.length; i++)
                ListTile(
                  tileColor: i == currentPageIndex ? AppColors.gray : AppColors.backgroundColor,
                  title: Text(
                    items[i],
                    style: TextStyle(fontSize: 18.sp, color: AppColors.fadedBlack, fontWeight: FontWeight.w900),
                  ),
                  onTap: () {
                    RouterHelper(context: context, where: pages[i]).goFadeAway();
                  },
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
