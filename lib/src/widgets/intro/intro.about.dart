import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroAbout extends StatelessWidget {
  const IntroAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Aplikacija komunikator je moćan alat dizajniran da pomogne osobama sa spektrom autizma da poboljšaju svoje komunikacijske veštine. Sa korisničkim interfejsom i širokim spektrom funkcija, aplikacija olakšava korisnicima da kreiraju i dele sopstvene društvene priče, grade i vežbaju svoje jezičke veštine, pa čak i komuniciraju sa drugima koristeći komunikacione sisteme zasnovane na slikama.',
      style: TextStyle(fontSize: 14.sp),
    );
  }
}
