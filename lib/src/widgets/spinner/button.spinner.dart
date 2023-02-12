import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonSpinner extends StatelessWidget {
  final int lineWidth, size;
  const ButtonSpinner({super.key, required this.lineWidth, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(color: AppColors.darkGrean, lineWidth: lineWidth.w, size: size.r),
    );
  }
}
