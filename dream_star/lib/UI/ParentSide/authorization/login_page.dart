import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes.dart';
// import 'package:localization/localization.dart';

class LoginParentScreen extends StatefulWidget {
  const LoginParentScreen({super.key});

  @override
  LoginParentScreenState createState() => LoginParentScreenState();
}

class LoginParentScreenState extends State<LoginParentScreen> {
  bool passwordVisible=false;

  @override
  void initState() {
    super.initState();
    passwordVisible=true;
  }

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 80),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: ElevatedButton.icon(
                  //     icon: SvgPicture.asset('assets/arrow-left-24px-secondary.svg'),
                  //     label: Text('Изменить роль',
                  //         style: titleSmallStyle.copyWith(color: secondary)),
                  //     style: ElevatedButton.styleFrom(
                  //       // backgroundColor: white,
                  //       elevation: 0,
                  //       shadowColor: Colors.transparent,
                  //     ),
                  //     onPressed: () {
                  //       print('Button Pressed');
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Рады Вас видеть!',
                              style: displayMediumStyle.copyWith(color: primary)),
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
                              text: 'Войдите, чтобы продолжить',
                              style: titleSmallStyle.copyWith(color: secondary)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: secondary),
                      color: white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Электронная почта',
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                      ),
                      style: titleSmallStyle,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: secondary),
                      color: white,
                    ),
                    child:  TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Пароль',
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() { passwordVisible = !passwordVisible; },);
                          },
                        ),
                      ),
                      style: titleSmallStyle,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: buttonWithoutBackingText,
                        onPressed: () {},
                        child: const Text('Забыли пароль?')
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // print('Button Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20),
                        textStyle: titleLargeStyle.copyWith(color: secondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                      child: const Text('Войти'),
                    ),
                  ),
                  const SizedBox(height: 130),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Впервые здесь?',
                                  style: titleSmallStyle.copyWith(color: secondary),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              style: buttonWithoutBackingText,
                              onPressed: () {},
                              child: const Text('Зарегистрируйтесь!')
                          ),
                        ]),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
