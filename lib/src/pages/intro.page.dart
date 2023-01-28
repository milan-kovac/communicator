import 'dart:developer';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/utils/router.helper.dart';
import 'package:communicator/src/widgets/intro/intro.email.input.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home.page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool formIsValid = false;
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: true,
        autoScrollDuration: 3000,
        showDoneButton: formIsValid,
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: AppColors.darkPurple,
            color: AppColors.washedOutBlue,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
        pages: [
          PageViewModel(
            title: "",
            bodyWidget: const Text(
                'Апликација комуникатор је моћан алат дизајниран да помогне особама са спектром аутизма да побољшају своје комуникацијске вештине. Са корисничким интерфејсом и широким спектром функција, апликација олакшава корисницима да креирају и деле сопствене друштвене приче, граде и вежбају своје језичке вештине, па чак и комуницирају са другима користећи комуникационе системе засноване на сликама. Без обзира да ли сте родитељ, неговатељ или терапеут, апликација комуникатор је суштинско средство за помоћ особама са спектром аутизма да побољшају своје комуникацијске и друштвене вештине.'),
            image: _buildImage('intro1.png'),
          ),
          PageViewModel(
            title: '',
            bodyWidget: const Text(
              "Aпликација је дизајнирана да помогне породицама са децом из спектра аутизма да управљају својим дневним рутинама и подрже њихово учење и друштвени развој. Апликација омогућава родитељима и старатељима да креирају прилагођене распореде и организују дан свог детета, као и да креирају друштвене приче и шаблоне за учење како би подржали развој свог детета.",
            ),
            image: _buildImage('intro2.png'),
          ),
          PageViewModel(
            titleWidget: const Align(
              alignment: Alignment.topLeft,
                child: Text(
              'Унесите мејл',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              textAlign: TextAlign.left,
            )),
            bodyWidget: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: () => setState(() {
                      formIsValid = formKey.currentState!.validate();
                      log(formIsValid.toString());
                    }),
                child: IntroEmailInput(inputController: inputController)),
            image: _buildImage('intro3.png'),
          ),
        ],
        onDone: () => RouterHelper(context: context, where: const HomePage()).goFadeAway(),
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(
          Icons.chevron_right_sharp,
          color: AppColors.lightPurple,
          size: 50,
        ),
        done: const Icon(
          Icons.done_all_sharp,
          color: AppColors.lightPurple,
          size: 40,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
      ),
    );
  }
}
