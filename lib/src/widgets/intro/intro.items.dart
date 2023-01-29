import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroItems extends StatelessWidget {
  const IntroItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: const [
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.book,
              color: AppColors.darkGrean,
            ),
            title: Text('Едукација'),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.calendarDay,
              color: AppColors.darkGrean,
            ),
            title: Text('Планирање'),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.headset,
              color: AppColors.darkGrean,
            ),
            title: Text('Подршка'),
          ),
        ],
      ),
    );
  }
}
