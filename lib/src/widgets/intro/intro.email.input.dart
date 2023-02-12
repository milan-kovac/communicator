import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app.color.dart';
import '../../utils/validators.dart';

class IntroEmailInput extends StatelessWidget {
  final TextEditingController inputController;
  const IntroEmailInput({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validators(value: value.toString()).isValidEmail() ? null : 'Unesite ispravnu mejl adresu.',
      cursorColor: Colors.black,
      style: TextStyle(decoration: TextDecoration.none, decorationColor: Colors.white, fontSize: 14.sp),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold
        ),
        contentPadding: EdgeInsets.all(20.r),
        filled: true,
        fillColor: AppColors.backgroundColor,
        border: const UnderlineInputBorder(),
        hintText: 'komunikator@gmail.com',
        hintStyle: TextStyle(color: Colors.black, fontSize: 13.sp, fontStyle: FontStyle.italic, letterSpacing: 0.2),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGrean, width: 1.5.w),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGrean, width: 1.5.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5.w, color: Colors.red),
        ),
      ),
    );
  }
}
