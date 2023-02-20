import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/learning.page.dart';
import 'package:communicator/src/services/auth.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pages/calendar.page.dart';
import '../../utils/router.helper.dart';

class Sidebar extends StatelessWidget {
  final int currentPageIndex;
  Sidebar({super.key, required this.currentPageIndex});
  List<String> items = ['Početak', 'Kalendar', 'Učenje', 'Emocije', 'Telo'];
  List<Widget> pages = [const HomePage(), const CalendarPage(), const LearningPage(), const HomePage(), const HomePage()];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250.h,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/logo.png',
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
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: GestureDetector(
                onTap: () => AuthService.logOut(context),
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  alignment: Alignment.center,
                  color: AppColors.gray,
                  child: Text(
                    'Odjava',
                    style: TextStyle(fontSize: 16.sp, color: AppColors.fadedBlack, fontWeight: FontWeight.w900),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
