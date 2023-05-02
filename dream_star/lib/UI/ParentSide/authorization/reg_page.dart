import 'package:dream_star/UI/ParentSide/authorization/login_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'dart:ui';
import '../../themes.dart';

class RegParentScreen extends StatefulWidget {
  const RegParentScreen({super.key});

  @override
  RegParentScreenState createState() => RegParentScreenState();
}

enum Switch { female, male }

class RegParentScreenState extends State<RegParentScreen> {
  Switch? _character = Switch.female;
  bool passwordVisible = false;
  bool passwordVisibleRep = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordVisibleRep = true;
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
                                  text: "create-account-text".i18n(),
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
                                  text: "create-account-info-text".i18n(),
                                  style: titleSmallStyle.copyWith(
                                      color: secondary),
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
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "name-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                      ),
                      style: const TextStyle(color:Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "second-name-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                      ),
                      style: const TextStyle(color:Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "birth-day-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                      ),
                      style: const TextStyle(color:Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      // color: Colors.white,
                      width: 40.0,
                      height: 21.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: secondary),
                      ),
                      child: Column(children: [
                        Text(
                          "sex".i18n(),
                        ),
                      ]),
                    ),
                  ),
                  // const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(2.0),
                        padding: const EdgeInsets.all(1.0),
                        width: 146,
                        child: RadioListTile<Switch>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(
                            "switch-female-text".i18n(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                          activeColor: Colors.deepPurpleAccent,
                          value: Switch.female,
                          groupValue: _character,
                          onChanged: (Switch? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(2.0),
                        padding: const EdgeInsets.all(1.0),
                        width: 146,
                        child: RadioListTile<Switch>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(
                            "switch-male-text".i18n(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                          activeColor: Colors.deepPurpleAccent,
                          value: Switch.male,
                          groupValue: _character,
                          onChanged: (Switch? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "email-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                      ),
                      style: const TextStyle(color:Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: TextField(
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
                      style: const TextStyle(color:Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: TextField(
                      obscureText: passwordVisibleRep,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "verify-password-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: secondary),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisibleRep
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passwordVisibleRep = !passwordVisibleRep;
                            });
                          },
                        ),
                      ),
                      style: const TextStyle(color:Colors.black),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // print('Button Pressed');
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
                      child: Text("submit-reg-text".i18n()),
                    ),
                  ),
                  const SizedBox(height: 80),
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
        child: Center(child: footerBtnReg()),
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
                  text: "info-reg-text".i18n(),
                  style: titleSmallStyle.copyWith(color: secondary),
                ),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 13),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const LoginParentScreen();
                  },
                ),
              );
            },
            child: Text(
              "info-btn-reg-text".i18n(),
              style: titleSmallStyle.copyWith(color: primary),
            ),
          ),
        ],
      ),
    );
  }
}