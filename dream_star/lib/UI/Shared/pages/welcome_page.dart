import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/routes.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import 'package:flutter_svg/svg.dart';
import 'dart:ui';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.read(userProvider);
    return Scaffold(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 75),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "welcome-text".i18n(),
                          style: displayMediumStyle.copyWith(color: primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: blockBackground,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(38.0))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: 0),
                            Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "thanks-text".i18n(),
                                      style: titleSmallStyle.copyWith(
                                          color: whiteTransparent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //
                            const SizedBox(height: 28),
                            Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "goal-text".i18n(),
                                      style: displayMediumStyle.copyWith(
                                          color: white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //
                            const SizedBox(height: 30),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // replace by future builder
                                      // userInfo.setUserRole(true);
                                      userInfo
                                          .parentSignIn(
                                            "test@test.ru",
                                            "test123",
                                          )
                                          .then((value) =>
                                              Navigator.pushReplacement(
                                                  context, tasksScreenRoute));
                                          // .catchError((error, stackTrace) =>
                                          //     error.toString());
                                      // print('Parrent Button Pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      textStyle: titleLargeStyle.copyWith(
                                          color: white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                    ),
                                    child: Text("parent-role".i18n()),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      userInfo
                                          .createParentAccount('Имя', 'Фамилия',
                                              'mail@mail.ru', 'asdaew!31')
                                          .then((value) => null);
                                          // .catchError((error, stackTrace) =>
                                          //     error.toString());
                                      // userInfo.setUserRole(false);
                                      // Navigator.pushReplacement(
                                      //     context, tasksScreenRoute);
                                      // print('Child Button Pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      textStyle: titleLargeStyle.copyWith(
                                          color: white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22.0),
                                      ),
                                    ),
                                    child: Text("child-role".i18n()),
                                  ),
                                ]),
                            const SizedBox(height: 30),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: labelSmallStyle.copyWith(
                                        color: secondPrimary),
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: SvgPicture.asset(
                                              'assets/info-empty-16px-second-primary.svg'),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "hint-text".i18n(),
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "hint-text-expanded".i18n(),
                                      style: labelSmallStyle.copyWith(
                                          color: white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
