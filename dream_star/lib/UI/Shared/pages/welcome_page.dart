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
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
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
                height: 450,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Color(0xff414141),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      style: titleSmallStyle.copyWith(color: secondary)),
                                ],
                              ),
                            ),
                          ),
                          //
                          const SizedBox(height: 28),
                          Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Мы помогаем детям \nобучаться \nфинансовой \nграмотности!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white)),
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
                                    Navigator.pushReplacement(context, tasksScreenRoute);
                                    // print('Parrent Button Pressed');
                                  },
                                  child: const Text('Я родитель'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 20),
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    userInfo.setUserRole(false);
                                    Navigator.pushReplacement(context, tasksScreenRoute);
                                    // print('Child Button Pressed');
                                  },
                                  child: const Text('Я ребёнок'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 20),
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ]),
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '\u{1F6C8} Небольшая подсказка',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: Colors.green)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Для начала необходимо зарегистрироваться родителю, а уже потом родитель добавит своих детей.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}
