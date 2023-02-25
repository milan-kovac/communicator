import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/global/custom.app.bar.dart';

class EmotionsPage extends StatelessWidget {
  const EmotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: const CustomAppBar()),
      drawer: Sidebar(currentPageIndex: 3),
      body:  NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: GridView.builder(
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 50),
        itemCount: 18,
        itemBuilder: (BuildContext context, int index) {
          return  Container(
            //margin: EdgeInsets.all(10.r),
            child: Card(
              child: Column(
                   children: [
                    Expanded (child: Image.asset('assets/images/emotions/${index+1}.jpg')),
                    Container(
                      margin: EdgeInsets.only(top: 10.r, bottom: 10.r),
                      child:  Text('Tuga', style: TextStyle(color: AppColors.fadedBlack, fontWeight: FontWeight.w600, fontSize: 18.sp),))
                   ],
              ),
            ),
          );
        },
        ),
      )
    );
  }
}
