import 'dart:convert';
import 'package:communicator/src/pages/emotion.single.page.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/global/custom.app.bar.dart';

class EmotionsPage extends StatefulWidget {
  const EmotionsPage({super.key});

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  List emotions = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/emotions.json');
    final data = await json.decode(response);
    setState(() {
      emotions = data["emotions"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: const CustomAppBar()),
        drawer: Sidebar(currentPageIndex: 3),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
             itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmotionSinglePage(emotion: emotions[index])));
                },
                child: Hero(
                  tag: emotions[index]['id'],
                  child: Column(
                    children: [
                      FadeInImage(placeholder: AssetImage(emotions[index]['image']), image: AssetImage(emotions[index]['image'])),
                      Text(
                        emotions[index]['description'],
                        style: TextStyle(color: AppColors.fadedBlack, fontWeight: FontWeight.w600, fontSize: 18.sp),
                      )
                    ],
                  ),
                ),
              );
          },
          separatorBuilder: (context, index) =>const Divider(
                color: Colors.transparent,
              ),
              itemCount: emotions.length),
        ));
  }
}
