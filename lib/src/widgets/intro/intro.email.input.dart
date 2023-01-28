import 'package:flutter/material.dart';

import '../../utils/app.color.dart';
import '../../utils/validators.dart';

class IntroEmailInput extends StatelessWidget {
  final TextEditingController inputController;
  const IntroEmailInput({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    final textFieldFocusNode = FocusNode();
    return TextFormField(
      focusNode: textFieldFocusNode,
      controller: inputController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => Validators(value: value.toString()).isValidEmail() ? null : 'Унесите исправну мејл адресу',
      cursorColor: Colors.black,
      style: TextStyle(
          decoration: TextDecoration.none,
          decorationColor: Colors.white,
          fontSize: 14),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 12,
        ),
        contentPadding: EdgeInsets.all(20),
        filled: true,
        fillColor: AppColors.fadeddGray,
        border: const UnderlineInputBorder(),
        hintText: '____________',
        prefixIcon: Icon(Icons.alternate_email_outlined, color: FocusScope.of(context).isFirstFocus ? Colors.black : Colors.black),
        hintStyle: TextStyle(
            color: AppColors.gray,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(width: 0.2, color: Colors.transparent),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.2, color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
