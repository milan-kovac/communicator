import 'package:communicator/src/bloc/sentence/sentence_bloc.dart';
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
  void animateScroll() {
    if (controller.hasClients) {
      controller.animateTo(
        controller.position.maxScrollExtent + 80.w,
        duration: const Duration(milliseconds: 500),
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
                                const InkWell(child: FaIcon(FontAwesomeIcons.play)),
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

  @override
  bool get wantKeepAlive => true;
}
