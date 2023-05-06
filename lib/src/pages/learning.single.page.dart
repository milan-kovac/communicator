import 'dart:convert';
import 'package:communicator/src/bloc/sentence/sentence_bloc.dart';
import 'package:communicator/src/models/word.dart';
import 'package:communicator/src/pages/learning.page.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/tts.service.dart';
import '../utils/router.helper.dart';
import '../widgets/learning/sentance.dart';

class LearningSinglePage extends StatefulWidget {
  final String learningType;
  const LearningSinglePage({super.key, required this.learningType});

  @override
  State<LearningSinglePage> createState() => _LearningSinglePageState();
}

class _LearningSinglePageState extends State<LearningSinglePage> {
  List items = [];
  int? clickedImage;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/learning.json');
    final data = await json.decode(response);
    setState(() {
      items = data[widget.learningType];
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
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h), // here the desired height
            child: AppBar(
              backgroundColor: AppColors.darkGrean,
              leading: IconButton(
                  color: Colors.white,
                  icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                  onPressed: () => RouterHelper(context: context, where: const LearningPage()).goFadeAway()),
            )),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: BlocConsumer<SentenceBloc, SentenceState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  const Sentance(),
                  Expanded(
                    flex: 8,
                    child: GridView.count(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 1,
                      crossAxisCount: 3,
                      children: [
                        for (var index = 0; index < items.length; index++)
                          InkWell(
                            onTap: () async => {
                              if (clickedImage == null)
                                {
                                  setState(() {
                                    clickedImage = index;
                                  }),
                                  TtsService(text: items[index]['description']).startSpeech().then((value) => {
                                        setState(() {
                                          clickedImage = null;
                                        })
                                      }),
                                  BlocProvider.of<SentenceBloc>(context)
                                      .add(AddWordEvent(Word(description: items[index]['description'], image: items[index]['image'])))
                                }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.r),
                                  color: Colors.transparent,
                                  child: FadeInImage(
                                    placeholder: const AssetImage('assets/images/spinner.gif'),
                                    image: AssetImage(items[index]['image']),
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                  ),
                                ),
                                Visibility(
                                  visible: clickedImage == index,
                                  child: Card(
                                      color: Colors.black.withOpacity(0.3),
                                      child: const SizedBox(
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          child: Center(child: FaIcon(FontAwesomeIcons.volumeHigh)))),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
