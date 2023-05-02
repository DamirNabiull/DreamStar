import 'package:dream_star/UI/themes.dart';
import 'package:flutter/material.dart';
// import 'package:localization/localization.dart';

import 'package:localization/localization.dart';

class ProfileParentScreen extends StatefulWidget {
  const ProfileParentScreen({super.key});

  @override
  ProfileParentScreenState createState() => ProfileParentScreenState();
}

class ProfileParentScreenState extends State<ProfileParentScreen> {
  // Switch? _character = Switch.female;
  bool passwordVisible = false;
  bool passwordVisibleRep = false;
  // ignore: non_constant_identifier_names
  var name_input_text = TextEditingController();
  var birth_day_input_text = TextEditingController();
  int _selectedIndex = 3;
  final List childrenListNames = <String>["Олег","Никита","Ева"];
  final List childrenListCodes = <String>["NEQ13","BY2W7","3LFB3"];

  @override
  void initState() {
    super.initState();
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
                          labelText:
                              "parent-profile-birth-day-input-text".i18n(),
                          labelStyle: titleSmallStyle.copyWith(color: primary),
                        ),
                        style: const TextStyle(color: Colors.black),
                        readOnly: true,
                        onTap: () {}),
                  ),
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
                                  text: "my-children-parent-profile-text".i18n(),
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
                    height: 120,
                    padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: secondary),
                    ),
                    child: ltsv(childrenListNames,childrenListCodes)
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        // print('Button Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        textStyle: titleSmallStyle.copyWith(color: secondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: RichText(
                        text: TextSpan(
                        children: [
                            TextSpan(
                              text: "add-child-text".i18n(),
                              style: const TextStyle(fontSize: 16,color: Colors.white)
                            ),
                            WidgetSpan(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0.9),
                                child: const Icon(Icons.add, size: 16,color: Colors.white),
                              ),
                            ),
                          ]
                        ),
                      ),
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
                      child: Text("parent-profile-exit-text".i18n(),style: const TextStyle(fontSize: 17)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //!!!!
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
                  child: Text('${childrenList[index]}',style: const TextStyle(fontSize: 16))
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('${childrenListCodes[index]}',style: titleSmallStyle.copyWith(color: primary))
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
