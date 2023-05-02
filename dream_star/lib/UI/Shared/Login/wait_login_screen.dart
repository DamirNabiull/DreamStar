import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class WaitLoginScreen extends StatelessWidget {
  const WaitLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const Spacer(),
                Text('loading-user-info'.i18n()),
                const SizedBox(height: 15,),
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
