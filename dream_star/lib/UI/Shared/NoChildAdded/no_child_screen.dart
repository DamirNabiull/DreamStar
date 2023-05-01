import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class NoChildScreen extends StatelessWidget {
  const NoChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('no-children'.i18n()),
    );
  }
}