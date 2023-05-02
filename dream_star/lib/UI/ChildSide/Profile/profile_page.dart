import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

class ProfileChildScreen extends ConsumerStatefulWidget {
  const ProfileChildScreen({super.key});

  @override
  ProfileChildScreenState createState() => ProfileChildScreenState();
}

class ProfileChildScreenState extends ConsumerState<ProfileChildScreen> {
  var nameInputText = TextEditingController();
  var birthDayInputText = TextEditingController();
  var loginCodeInputText = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameInputText.text = "Сергей Нечалов";
    birthDayInputText.text = "12.10.1986";
    loginCodeInputText.text = "BY2W7";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(title: const Text('Profile'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            //
          },
        ),
      ]),
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
                                  text: "my-data-parent-profile-text".i18n(),
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
                      controller: nameInputText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "parent-profile-name-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: primary),
                      ),
                      style: const TextStyle(color: Colors.black),
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
                        controller: birthDayInputText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText:
                              "parent-profile-birth-day-input-text".i18n(),
                          labelStyle: titleSmallStyle.copyWith(color: primary),
                        ),
                        style: const TextStyle(color: Colors.black),
                        readOnly: true,
                        onTap: () {}),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: TextField(
                        controller: loginCodeInputText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "child-profile-code-input-text".i18n(),
                          labelStyle: titleSmallStyle.copyWith(color: primary),
                        ),
                        style: const TextStyle(color: Colors.black),
                        readOnly: true,
                        onTap: () {}),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      onPressed: () {
                        ref.read(userProvider).signOut();
                        Navigator.pushReplacementNamed(
                          context, '/',);
                      },
                      child: Text(
                        "parent-profile-exit-text".i18n(),
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
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
