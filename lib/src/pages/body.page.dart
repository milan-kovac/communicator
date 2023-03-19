import 'dart:convert';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/custom.app.bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/global/sidebar.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  List body = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/body.json');
    final data = await json.decode(response);
    setState(() {
      body = data["body"];
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
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: const CustomAppBar()),
        drawer: Sidebar(currentPageIndex: 4),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListWheelScrollView(perspective: 0.010, physics: const FixedExtentScrollPhysics(), diameterRatio:3, itemExtent: 300, children: [
            for (var i = 0; i < body.length; i++)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.r,
                      blurRadius: 7.r,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  body[i]['image'],
                  height: 300.h,
                  width: 300.w,
                ),
              )
          ]),
        ));
  }
}
