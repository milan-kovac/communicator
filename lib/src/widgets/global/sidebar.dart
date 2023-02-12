import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/learning.page.dart';
import 'package:communicator/src/services/auth.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../pages/calendar.page.dart';
import '../../utils/router.helper.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        children:[
          SizedBox(
            height: 250.h,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.backgroundColor,
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/logo.jpg',
              ),
            ),
          ),
          Expanded(
            child: Column(children: <Widget>[
              ListTile(
                title: const Text(
                  'Početak',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  RouterHelper(context: context, where: const HomePage()).goFadeAway();
                },
              ),
              ListTile(
                title: const Text(
                  'Kalendar',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                onTap: () {
                  RouterHelper(context: context, where: const CalendarPage()).goFadeAway();
                },
              ),
              ListTile(
                title: const Text(
                  'Učenje',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                onTap: () {
                  RouterHelper(context: context, where: const LearningPage()).goFadeAway();
                },
              ),
              ListTile(
                title: const Text(
                  'Emocije',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                onTap: () {
                  /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                },
              ),
              ListTile(
                title: const Text(
                  'Telo',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                onTap: () {
                  /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                },
              ),
            ]),
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => AuthService.logOut(context),
                    trailing: TextButton.icon(
                        onPressed: null,
                        icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                        label: const Text(
                          'Odjava',
                          style: TextStyle(fontSize: 15),
                        )),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
