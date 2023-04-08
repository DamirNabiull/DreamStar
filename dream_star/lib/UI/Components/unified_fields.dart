import 'package:dream_star/UI/Components/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../themes.dart';

class UnifiedFields extends StatelessWidget {
  final Widget widget1;
  final Widget? widget2;
  const UnifiedFields({super.key, required this.widget1, required this.widget2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12.0)),
      child: IntrinsicHeight(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: 20.0),
              child: widget1
          ),
          widget2 != null ? const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(height: 0, color: secondary),
          ) : const SizedBox.shrink(),
          widget2 != null ? Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: 20.0),
              child: widget2
          ) : const SizedBox.shrink()
        ])
      ),
    );
  }
}
