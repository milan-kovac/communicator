import 'package:communicator/src/data/learning.page.items.dart';
import 'package:communicator/src/pages/learning.single.page.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/router.helper.dart';
import '../widgets/global/custom.app.bar.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<LearningPageItems> pageItems = LearningPageItems.getLearningPageItems();
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
            for (var i = 0; i < pageItems.length; i++)
              GestureDetector(
                onTap: () => RouterHelper(context: context, where: LearningSinglePage(learningType: pageItems[i].learningType)).goFadeAway(),
                child: Card(
                  color: AppColors.darkGrean,
                  child: Center(
                      child: FaIcon(
                    pageItems[i].icon,
                    color: Colors.white,
                    size: 30.r,
                  )),
                ),
              ),
          ],
        ));
  }
}
