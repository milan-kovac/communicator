import 'package:communicator/src/bloc/sentence/sentence_bloc.dart';
import 'package:communicator/src/services/tts.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sentance extends StatefulWidget {
  const Sentance({super.key});

  @override
  State<Sentance> createState() => _SentanceState();
}

class _SentanceState extends State<Sentance> {
  final ScrollController controller = ScrollController();
  bool isPlay = false;
  void animateScroll() {
    if (controller.hasClients) {
      controller.animateTo(
        controller.position.maxScrollExtent + 85.w,
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => animateScroll());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentenceBloc, SentenceState>(
      builder: (context, state) {
        return state is FullSentenceState
            ? Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: BlocListener<SentenceBloc, SentenceState>(
                        listener: (context, state) {
                          animateScroll();
                        },
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return true;
                          },
                          child: ListView(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < state.sentence.length; i++)
                                Card(
                                  child: Image.asset(
                                    state.sentence[i].image,
                                    width: 80.w,
                                    height: 80.h,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {
                                      List<String> words = state.sentence.map((e) => e.description).toList();
                                      String sentence = words.join(' ');
                                      setState(() {
                                        isPlay = !isPlay;
                                      });
                                      TtsService(text: sentence).startSpeech().then((value) => {
                                            setState(() {
                                              isPlay = !isPlay;
                                            })
                                          });
                                    },
                                    child: FaIcon(isPlay ? FontAwesomeIcons.pause : FontAwesomeIcons.play)),
                                InkWell(
                                    onTap: () => BlocProvider.of<SentenceBloc>(context).add(RemoveSentenceEvent()),
                                    child: const FaIcon(FontAwesomeIcons.xmark))
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}
