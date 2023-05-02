import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

class BalanceChildScreen extends ConsumerStatefulWidget {
  const BalanceChildScreen({super.key});

  @override
  BalanceChildScreenState createState() => BalanceChildScreenState();
}

class BalanceChildScreenState extends ConsumerState<BalanceChildScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Balance'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 60,
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
                                  text: "my-balance-child-profile-text".i18n(),
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
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: Row(children: [
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "stars-earned-child-balance-text".i18n(),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black))),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: ref
                                    .read(userProvider)
                                    .getChildStars()
                                    .toString(),
                                style:
                                    displayMediumStyle.copyWith(color: primary),
                              ),
                              WidgetSpan(
                                child: Container(
                                  padding: const EdgeInsets.all(2.2),
                                  child: const Icon(
                                    Icons.grade,
                                    size: 24,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
