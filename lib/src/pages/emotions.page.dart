import 'dart:convert';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/tts.service.dart';
import '../widgets/global/custom.app.bar.dart';

class EmotionsPage extends StatefulWidget {
  const EmotionsPage({super.key});

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  List emotions = [];
  int? clickedImage;

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
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                for (var index = 0; index < emotions.length; index++)
                  InkWell(
                    onTap: () async {
                      if (clickedImage == null) {
                        setState(() {
                          clickedImage = index;
                        });
                        TtsService(text: emotions[index]['description']).startSpeech().then((value) => {
                              setState(() {
                                clickedImage = null;
                              })
                            });
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Card(
                          elevation: 15,
                          child: FadeInImage(placeholder: AssetImage(emotions[index]['image']), image: AssetImage(emotions[index]['image'])),
                        ),
                        Visibility(
                          visible: clickedImage == index,
                          child: Card(
                              color: Colors.black.withOpacity(0.3),
                              child: const SizedBox(
                                  width: double.infinity, height: double.infinity, child: Center(child: FaIcon(FontAwesomeIcons.volumeHigh)))),
                        ),
                      ],
                    ),
                  ),
              ],
            )));
  }
}
