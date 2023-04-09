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
    const focusedBorderColor = Color.fromRGBO(110, 90, 246, 1);
    const fillColor = Color.fromRGBO(110, 90, 246, 1);
    const borderColor = Color.fromRGBO(110, 90, 246, 1);

    String code_validate = "BW401";

    final defaultPinTheme = PinTheme(
      width: 46,
      height: 66,
      textStyle: const TextStyle(
        fontSize: 30,
        color: Color(0xffffffff),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    final int code_length = 5;

    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          SvgPicture.asset('assets/background/green-blured-blobs-background.svg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.transparent,),
              )
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                        size: 20.0,
                      ),
                      label: const Text('Изменить роль',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.grey)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        print('Button Pressed');
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
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
                          // Specify direction if desired
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            length: code_length,
                            controller: pinController,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            validator: (value) {
                              return value == code_validate
                                  ? null
                                  : 'Code is incorrect';
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
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: focusedBorderColor),
                                //unfill gap
                              ),
                              textStyle: const TextStyle(
                                fontSize: 30,
                                color: Color(0xff000000),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: focusedBorderColor),
                                //fill gap
                              ),
                              textStyle: const TextStyle(
                                fontSize: 30,
                                color: Color(0xffffffff),
                              ),
                            ),
                            followingPinTheme: defaultPinTheme.copyWith(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                color: Color(0xff000000),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                border: Border.all(color: Colors.redAccent),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 30,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              focusNode.unfocus();
                              formKey.currentState!.validate();
                              print('Button Pressed');
                            },
                            child: const Text('Войти'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
