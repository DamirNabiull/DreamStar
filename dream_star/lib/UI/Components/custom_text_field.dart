import 'package:flutter/material.dart';

import '../themes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? placeholder;
  final int? maxLines;
  final int? maxLength;

  const CustomTextField({super.key,
    required this.textEditingController,
    required this.placeholder,
    required this.maxLines,
    required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        counterText: "",
        hintText: placeholder,
        hintStyle: titleSmallStyleSecondary,
        border: InputBorder.none,
      ),
      style: titleSmallStyle,
      onChanged: (String text) {
        textEditingController.text = text;
      },
    );
  }

}