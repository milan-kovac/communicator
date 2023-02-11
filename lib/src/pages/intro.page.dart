import 'package:communicator/src/services/auth.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/utils/router.helper.dart';
import 'package:communicator/src/widgets/intro/intro.about.dart';
import 'package:communicator/src/widgets/intro/intro.email.input.dart';
import 'package:communicator/src/widgets/intro/intro.items.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home.page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  var introKey = null;
  var formKey = null;
  final inputController = TextEditingController();

  bool formIsValid = false;
  String email = '';

  Widget buildImage(String assetName, [double width = 350]) {
    return SizedBox(height: double.infinity, width: double.infinity, child: Image.asset('assets/images/$assetName', width: width));
  }

  @override
  void initState() {
    setState(() {
      introKey = GlobalKey<IntroductionScreenState>();
      formKey = GlobalKey<FormState>();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: AppColors.backgroundColor,
          allowImplicitScrolling: false,
          showDoneButton: formIsValid,
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: AppColors.darkGrean,
              color: AppColors.washedOutBlue,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
          pages: [
            PageViewModel(
                title: '',
                bodyWidget: const IntroItems(),
                image: buildImage('intro1.png'),
                decoration: const PageDecoration(imagePadding: EdgeInsets.only(bottom: 0, top: 50))),
            PageViewModel(
                title: "",
                bodyWidget: const IntroAbout(),
                image: buildImage('intro2.png'),
                decoration: const PageDecoration(imagePadding: EdgeInsets.only(bottom: 0, top: 50))),
            PageViewModel(
                titleWidget: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Унесите мејл',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    )),
                bodyWidget: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: () => setState(() {
                          formIsValid = formKey.currentState!.validate();
                          email = inputController.text;
                        }),
                    child: IntroEmailInput(inputController: inputController)),
                image: buildImage('intro3.png'),
                decoration: const PageDecoration(imagePadding: EdgeInsets.only(bottom: 0, top: 50))),
          ],
          onDone: () {
            FocusScope.of(context).unfocus();
            AuthService.anonymousLogin(email).then((value) => RouterHelper(context: context, where: const HomePage()).goFadeAway());
          },
          back: const Icon(Icons.arrow_back),
          next: const Icon(
            Icons.chevron_right_sharp,
            color: AppColors.darkGrean,
            size: 50,
          ),
          done: const Icon(
            Icons.done_all_sharp,
            color: AppColors.darkGrean,
            size: 40,
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
