import 'package:flutter/material.dart';
// import 'package:localization/localization.dart';

import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'dart:ui';
import '../../themes.dart';

class BalanceParentScreen extends StatefulWidget {
  const BalanceParentScreen({super.key});

  @override
  BalanceParentScreenState createState() => BalanceParentScreenState();
}

class BalanceParentScreenState extends State<BalanceParentScreen> {
  int _selectedIndex = 2;
  final List childrenListNames = <String>["Олег","Никита","Ева"];
  final List childrenListBalances = <String>["21","123","33"];

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
                                  text: "my-children-balances-parent-profile-text".i18n(),
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
                    height:120,
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: ltsv(childrenListNames,childrenListBalances)
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


Widget ltsv(childrenList,childrenListCodes){
  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: childrenList.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 22,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('${childrenList[index]}',style: titleSmallStyle.copyWith(color: primary))
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child:RichText(
                  text: TextSpan(
                  children: [
                      TextSpan(
                        text: '${childrenListCodes[index]}',
                        style: const TextStyle(fontSize: 16)
                      ),
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.all(2.2),
                          child: const Icon(Icons.grade, size: 14,color: Colors.yellow,),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
}
