import 'package:flutter/material.dart';
// import 'package:localization/localization.dart';

import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'dart:ui';
import '../../themes.dart';

class BalanceChildScreen extends StatefulWidget {
  const BalanceChildScreen({super.key});

  @override
  BalanceChildScreenState createState() => BalanceChildScreenState();
}

class BalanceChildScreenState extends State<BalanceChildScreen> {
  int _selectedIndex = 2;
  int starsNum = 53;

  @override
  void initState() {
    super.initState();
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
                    height:60,
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: 
                    Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("stars-earned-child-balance-text".i18n(),style: const TextStyle(fontSize: 16,color: Colors.black))
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child:RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: starsNum.toString(),
                                    style: displayMediumStyle.copyWith(color: primary)
                                  ),
                                  WidgetSpan(
                                    child: Container(
                                      padding: const EdgeInsets.all(2.2),
                                      child: const Icon(Icons.grade, size: 24,color: Colors.yellow,),
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
