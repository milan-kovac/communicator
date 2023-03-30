import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/global/custom.app.bar.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar()),
        drawer: Sidebar(currentPageIndex: 2),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Card(
              color: AppColors.darkGrean,
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.buildingColumns,
                color: Colors.white,
                size: 30.r,
              )),
            ),
            Card(
              color: AppColors.darkGrean,
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.bus,
                color: Colors.white,
                size: 30.r,
              )),
            ),
          ],
        ));
  }
}
