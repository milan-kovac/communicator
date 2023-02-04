import 'package:communicator/src/pages/home.page.dart';
import 'package:communicator/src/pages/learning.page.dart';
import 'package:communicator/src/services/auth.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
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
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
          Expanded(
            child: Column(children: <Widget>[
              ListTile(
                title: const Text(
                  'Почетак',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                leading: const FaIcon(
                  FontAwesomeIcons.houseUser,
                  size: 20.0,
                  color: AppColors.darkGrean,
                ),
                onTap: () {
                  RouterHelper(context: context, where: const HomePage())
                      .goFadeAway();
                },
              ),
              ListTile(
                title: const Text(
                  'Календар',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                leading: const FaIcon(
                  FontAwesomeIcons.calendarDays,
                  size: 20.0,
                  color: AppColors.darkGrean,
                ),
                onTap: () {
                  RouterHelper(context: context, where: const CalendarPage())
                      .goFadeAway();
                },
              ),
              ListTile(
                title: const Text(
                  'Учење',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                leading: const FaIcon(
                  FontAwesomeIcons.chalkboard,
                  size: 20.0,
                  color: AppColors.darkGrean,
                ),
                onTap: () {
                  RouterHelper(context: context, where: const LearningPage())
                      .goFadeAway();
                },
              ),
              ListTile(
                title: const Text(
                  'Емоције',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                leading: const FaIcon(
                  FontAwesomeIcons.faceSmile,
                  size: 20.0,
                  color: AppColors.darkGrean,
                ),
                onTap: () {
                  /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => mistakePage()));*/
                },
              ),
              ListTile(
                title: const Text(
                  'Моје тело',
                  style: TextStyle(fontSize: 18.0, color: AppColors.darkGrean),
                ),
                leading: const FaIcon(
                  FontAwesomeIcons.children,
                  size: 20.0,
                  color: AppColors.darkGrean,
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
                        label: const Text('Одјава', style: TextStyle( fontSize: 15),)),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
