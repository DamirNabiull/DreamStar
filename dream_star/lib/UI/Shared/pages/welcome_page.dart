import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/Shared/Tasks/tasks_main_screen.dart';
import 'package:dream_star/UI/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:localization/localization.dart';

import 'package:flutter_svg/svg.dart';
import 'dart:ui';
import '../../themes.dart';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.read(userProvider);
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: white,
      body: Stack(
        children: [
          SvgPicture.asset(
              'assets/background/green-blured-blobs-background.svg',
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
                            text: 'Добро пожаловать!',
                            style: displayMediumStyle.copyWith(color: primary)),
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
                                        text: 'Спасибо, что выбрали нас!',
                                        style: titleSmallStyle.copyWith(
                                            color: whiteTransparent)),
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
                                        text:
                                        'Мы помогаем детям обучаться финансовой грамотности!',
                                        style: displayMediumStyle.copyWith(
                                            color: white)),
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
                                      userInfo.setUserRole(true);
                                      Navigator.pushReplacement(
                                          context, tasksScreenRoute);
                                      // print('Parrent Button Pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      textStyle:
                                      titleLargeStyle.copyWith(color: white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22.0),
                                      ),
                                    ),
                                    child: const Text('Я родитель'),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      userInfo.setUserRole(false);
                                      Navigator.pushReplacement(
                                          context, tasksScreenRoute);
                                      // print('Child Button Pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 20),
                                      textStyle:
                                      titleLargeStyle.copyWith(color: white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(22.0),
                                      ),
                                    ),
                                    child: const Text('Я ребёнок'),
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
                                      const TextSpan(
                                          text: 'Небольшая подсказка.'),
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
                                        text:
                                        'Для начала необходимо зарегистрироваться родителю, а уже потом родитель добавит своих детей.',
                                        style: labelSmallStyle.copyWith(
                                            color: white)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
