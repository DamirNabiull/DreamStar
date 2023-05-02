import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';

class LoginChildScreen extends ConsumerStatefulWidget {
  const LoginChildScreen({super.key});

  @override
  LoginChildScreenState createState() => LoginChildScreenState();
}

class LoginChildScreenState extends ConsumerState<LoginChildScreen> {
  final _pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool _isLogging = false;

  final snackBar = const SnackBar(
    content: Text('Check your input field again',
        style: TextStyle(color: Colors.black, fontSize: 17)),
  );

  Future<void> showHint() async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();

    _pinController.addListener(() {
      final String text = _pinController.text;

      _pinController.value = _pinController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = primary;
    const fillColor = primary;
    const borderColor = secondary;

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: white,
      body: Stack(children: [
        SvgPicture.asset(
          'assets/background/green-blured-blobs-background.svg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(23.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "child-login-welcome-text".i18n(),
                                style:
                                    displayMediumStyle.copyWith(color: primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "child-login-info-text".i18n(),
                                style:
                                    titleSmallStyle.copyWith(color: secondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          keyboardType: TextInputType.text,
                          length: codeLength,
                          controller: _pinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onChanged: (value) {
                            _pinController.text = value.toUpperCase();
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
                                  color: focusedBorderColor,
                                  width: 6,
                                ),
                              ),
                              textStyle:
                                  displayLargeStyle.copyWith(color: primary)),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: fillColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: focusedBorderColor),
                            ),
                            textStyle: displayLargeStyle.copyWith(color: white),
                          ),
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
                            if (!_isLogging) {
                              _isLogging = true;
                              focusNode.unfocus();
                              formKey.currentState!.validate();
                              ref
                                  .read(userProvider)
                                  .childSignIn(_pinController.text)
                                  .then((value) {
                                Navigator.of(context).pop();
                                _isLogging = false;
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/main',
                                );
                              }).onError((error, stackTrace) {
                                showHint();
                                null;
                              });
                              _isLogging = false;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            textStyle: titleLargeStyle.copyWith(color: white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                          child: Text(
                            "enter-submit-text".i18n(),
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
