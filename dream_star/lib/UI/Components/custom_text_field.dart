import 'package:flutter/material.dart';

import '../themes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? placeholder;
  final int? maxLines;
  final int? maxLength;

  const CustomTextField(this.textEditingController, [this.placeholder, this.maxLines, this.maxLength]);

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
    );
  }

}