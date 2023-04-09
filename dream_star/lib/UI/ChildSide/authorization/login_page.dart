import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
// import 'package:localization/localization.dart';

import 'package:flutter_svg/svg.dart';
import 'dart:ui';
import '../../themes.dart';

class LoginChildScreen extends StatefulWidget {
  const LoginChildScreen({super.key});

  @override
  LoginChildScreenState createState() => LoginChildScreenState();
}

class LoginChildScreenState extends State<LoginChildScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = primary;
    const fillColor = primary;
    const borderColor = secondary;

    String codeValidate = "BW401";

    final defaultPinTheme = PinTheme(
      width: 46,
      height: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );

    const int codeLength = 5;

    return Scaffold(
      backgroundColor: white,
      body: Stack(children: [
        SvgPicture.asset('assets/background/green-blured-blobs-background.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.transparent,
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 100),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Привет!',
                          style: displayMediumStyle.copyWith(color: primary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Введи код, который ты получил от родителей',
                          style: titleSmallStyle.copyWith(color: secondary),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 90),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: codeLength,
                          controller: pinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          validator: (value) {
                            return value == codeValidate
                                ? null
                                : 'Неверный код';
                          },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 3,
                                color: focusedBorderColor,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: focusedBorderColor, width: 6),
                              ),
                              textStyle:
                                  displayLargeStyle.copyWith(color: primary)),
                          submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: focusedBorderColor),
                              ),
                              textStyle:
                                  displayLargeStyle.copyWith(color: white)),
                          followingPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: secondary, width: 4),
                            ),
                            textStyle:
                                displayLargeStyle.copyWith(color: primary),
                          ),
                          errorPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: white,
                              border: Border.all(color: red, width: 4),
                            ),
                            textStyle: displayLargeStyle.copyWith(color: red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            focusNode.unfocus();
                            formKey.currentState!.validate();
                            print('Button Pressed');
                          },
                          child: const Text('Войти'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            textStyle: titleLargeStyle.copyWith(color: white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
