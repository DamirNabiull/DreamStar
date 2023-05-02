import 'dart:ui';

import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/ParentSide/authorization/reg_page.dart';
import 'package:dream_star/UI/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

import '../../themes.dart';

class LoginParentScreen extends ConsumerStatefulWidget {
  const LoginParentScreen({super.key});

  @override
  LoginParentScreenState createState() => LoginParentScreenState();
}

class LoginParentScreenState extends ConsumerState<LoginParentScreen> {
  bool passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isLogging = false;
  
  final snackBar = const SnackBar(
    content: Text('Check your input field again',style: TextStyle(color:Colors.black,fontSize: 17)),
  );

  Future<Null> showHint() async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = true;

    _emailController.addListener(() {
      final String text = _emailController.text;

      _emailController.value = _emailController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    _passController.addListener(() {
      final String text = _passController.text;
      _passController.value = _passController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: white,
      body: Stack(
        children: [
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
                                  text: "welcome-login-parent-text".i18n(),
                                  style: displayMediumStyle.copyWith(
                                      color: primary),
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
                                  text: "info-login-parent-text".i18n(),
                                  style: titleSmallStyle.copyWith(
                                    color: secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: secondary),
                      color: white,
                    ),
                    child: TextField(
                      controller: _emailController,
                      onChanged: (String text) {
                        _emailController.text = text;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "email-input-text".i18n(),
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
                    child: TextField(
                      controller: _passController,
                      onChanged: (String text) {
                        _passController.text = text;
                      },
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "password-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
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
                      child: Text(
                        "password-input-text".i18n(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_isLogging) {
                          _isLogging = true;
                          ref
                              .read(userProvider)
                              .signIn(
                                  _emailController.text, _passController.text)
                              .then((value) {
                            Navigator.pop(context);
                            _isLogging = false;
                            Navigator.pushReplacement(
                                context, tasksScreenRoute);
                          }).onError((error, stackTrace) => showHint());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 20,
                        ),
                        textStyle: titleLargeStyle.copyWith(color: secondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                      child: Text(
                        "enter-submit-text".i18n(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: Colors.transparent,
        height: 70,
        child: Center(
          child: footerBtnReg(),
        ),
      ),
    );
  }

  Widget footerBtnReg() {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "info-login-parent-bottom-text".i18n(),
                  style: titleSmallStyle.copyWith(color: secondary),
                ),
              ],
            ),
          ),
          TextButton(
            style: buttonWithoutBackingText,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const RegParentScreen();
                  },
                ),
              );
            },
            child: Text("info-login-parent-bottom-btn-text".i18n()),
          ),
        ],
      ),
    );
  }
}
