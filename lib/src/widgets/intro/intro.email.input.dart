import 'package:flutter/material.dart';
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
      validator: (value) => Validators(value: value.toString()).isValidEmail() ? null : 'Унесите исправну мејл адресу',
      cursorColor: Colors.black,
      style: const TextStyle(decoration: TextDecoration.none, decorationColor: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          fontSize: 12,
        ),
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        fillColor: AppColors.backgroundColor,
        border: const UnderlineInputBorder(),
        hintText: 'комуникатор@гмаил.цом',
        suffixIcon: Icon(Icons.email_outlined, color: FocusScope.of(context).isFirstFocus ? AppColors.darkGrean : AppColors.darkGrean),
        hintStyle: const TextStyle(color: Colors.black, fontSize: 14, fontStyle: FontStyle.italic, letterSpacing: 0.2),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGrean),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGrean),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
      ),
    );
  }
}
