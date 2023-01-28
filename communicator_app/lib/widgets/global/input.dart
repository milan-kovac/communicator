import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 300,
    height: 40,
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.transparent),
            color: Colors.white

          ), 
    child: TextFormField());
  }
}