import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Text(
          'Društvo za podršku \nosobama sa autizmom \nGrada Novog Sada',
          style: TextStyle(color: AppColors.fadedBlack, fontSize: 16.sp, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
