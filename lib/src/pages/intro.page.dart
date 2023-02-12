import 'package:communicator/src/services/auth.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/utils/router.helper.dart';
import 'package:communicator/src/widgets/intro/intro.about.dart';
import 'package:communicator/src/widgets/intro/intro.email.input.dart';
import 'package:communicator/src/widgets/intro/intro.items.dart';
import 'package:communicator/src/widgets/spinner/button.spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home.page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late GlobalKey<IntroductionScreenState> introKey;
  late GlobalKey<FormState> formKey;
  final inputController = TextEditingController();
  bool spinner = false;
  bool formIsValid = false;
  String email = '';

  Widget buildImage(String assetName) {
    return SizedBox(height: double.infinity, width: double.infinity, child: Image.asset('assets/images/$assetName', width: 500.w));
  }

  void setSpinner() {
    setState(() {
      spinner = !spinner;
    });
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
              size: Size.square(10.r),
              activeSize: Size(20.r, 10.r),
              activeColor: AppColors.darkGrean,
              spacing: EdgeInsets.symmetric(horizontal: 4.r),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r))),
          nextStyle: ButtonStyle(
            enableFeedback: true,
            overlayColor: MaterialStateColor.resolveWith((states) => AppColors.lightGrean),
          ),
          doneStyle: ButtonStyle(
            enableFeedback: true,
            overlayColor: MaterialStateColor.resolveWith((states) => AppColors.lightGrean),
          ),
          pages: [
            PageViewModel(
                title: '',
                bodyWidget: IntroItems(),
                image: buildImage('intro1.png'),
                decoration: PageDecoration(imagePadding: EdgeInsets.only(bottom: 0, top: 20.r))),
            PageViewModel(
                title: "",
                bodyWidget: const IntroAbout(),
                image: buildImage('intro2.png'),
                decoration: PageDecoration(imagePadding: EdgeInsets.only(bottom: 0, top: 20.r))),
            PageViewModel(
                titleWidget: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Unesite mejl :',
                      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
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
                decoration: PageDecoration(imagePadding: EdgeInsets.only(bottom: 0, top: 20.r))),
          ],
          onDone: () {
            setSpinner();
            FocusScope.of(context).unfocus();
            AuthService.anonymousLogin(email).then((value) {
              RouterHelper(context: context, where: const HomePage()).goFadeAway();
            });
          },
          back: const Icon(Icons.arrow_back),
          next: Icon(
            Icons.chevron_right_sharp,
            color: AppColors.darkGrean,
            size: 50.r,
          ),
          done: spinner
              ? const ButtonSpinner(lineWidth: 3, size: 40)
              : Icon(
                  Icons.done_all_sharp,
                  color: AppColors.darkGrean,
                  size: 40.r,
                ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: EdgeInsets.all(16.r),
        ),
      ),
    );
  }
}
