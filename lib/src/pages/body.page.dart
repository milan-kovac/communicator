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
          child: ListView(children: [
            for (var i = 0; i < body.length; i++)
              Center(
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 300.w,
                    height: 200.h,
                    child: Card(
                      child: Image.asset(
                        body[i]['image'],
                      ),
                    ),
                  ),
                ),
              )
          ]),
        ));
  }
}
