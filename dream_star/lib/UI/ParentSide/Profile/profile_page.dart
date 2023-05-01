import 'package:flutter/material.dart';
// import 'package:localization/localization.dart';

import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'dart:ui';
import '../../themes.dart';

class ProfileParentScreen extends StatefulWidget {
  const ProfileParentScreen({super.key});

  @override
  ProfileParentScreenState createState() => ProfileParentScreenState();
}

enum Switch { female, male }

class ProfileParentScreenState extends State<ProfileParentScreen> {
  Switch? _character = Switch.female;
  bool passwordVisible = false;
  bool passwordVisibleRep = false;
  var name_input_text = TextEditingController();
  var birth_day_input_text = TextEditingController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordVisibleRep = true;
    //example
    name_input_text.text = "Сергей Нечалов";
    birth_day_input_text.text = "12.10.1986";
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Profile'), 
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //
            },
          ),
        ]
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
                                  text: "my-data-parent-profile-text".i18n(),
                                  style: titleSmallStyle.copyWith(color: secondary),
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
                      controller: name_input_text,
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
                      controller: birth_day_input_text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "parent-profile-birth-day-input-text".i18n(),
                        labelStyle: titleSmallStyle.copyWith(color: primary),
                      ),
                      style: const TextStyle(color: Colors.black),
                      readOnly: true,
                      onTap: () {

                      }
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      onPressed: () {
                        //
                      },
                      child: Text("parent-profile-exit-text".i18n(),style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( //!!!!
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.format_list_bulleted),
            label: "bottom-nav-bar-tasks-text".i18n(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.grade),
            label: "bottom-nav-bar-dreams-text".i18n(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance_wallet),
            label: "bottom-nav-bar-balance-text".i18n(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "bottom-nav-bar-profile-text".i18n(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: const Color.fromRGBO(106, 105, 105, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}

