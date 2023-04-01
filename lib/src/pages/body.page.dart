import 'dart:convert';
import 'package:communicator/src/services/tts.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/custom.app.bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/global/sidebar.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  List body = [];
  int? clickedImage;

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
            for (var index = 0; index < body.length; index++)
              Center(
                child: InkWell(
                  onTap: () async {
                    if (clickedImage == null) {
                      setState(() {
                        clickedImage = index;
                      });
                      TtsService(text: body[index]['description']).startSpeech().then((value) => {
                            setState(() {
                              clickedImage = null;
                            })
                          });
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 300.w,
                        height: 200.h,
                        child: Card(
                          elevation: 5,
                          child: Image.asset(
                            body[index]['image'],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: clickedImage == index,
                        child: SizedBox(
                          width: 300.w,
                          height: 200.h,
                          child: Card(color: Colors.black.withOpacity(0.3), child: const Center(child: FaIcon(FontAwesomeIcons.volumeHigh))),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ]),
        ));
  }
}
