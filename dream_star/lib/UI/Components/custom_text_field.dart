import 'package:flutter/material.dart';

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
        hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 17.0),
        border: InputBorder.none,
      ),
      onChanged: (String text) {
        textEditingController.text = text;
      },
    );
  }

}