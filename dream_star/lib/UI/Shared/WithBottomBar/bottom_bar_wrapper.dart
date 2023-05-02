import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/UI/ChildSide/Balance/balance_page.dart';
import 'package:dream_star/UI/ChildSide/Profile/profile_page.dart';
import 'package:dream_star/UI/ParentSide/Balance/balance_page.dart';
import 'package:dream_star/UI/ParentSide/Profile/profile_page.dart';
import 'package:dream_star/UI/Shared/Connection/no_connection_wrapper.dart';
import 'package:dream_star/UI/Shared/Login/wait_login_screen.dart';
import 'package:dream_star/UI/Shared/Tasks/tasks_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

class BottomBarWrapper extends ConsumerStatefulWidget {
  const BottomBarWrapper({super.key});

  @override
  BottomBarWrapperState createState() => BottomBarWrapperState();
}

class BottomBarWrapperState extends ConsumerState<ConsumerStatefulWidget> {
  int _index = 0;
  final List<Widget> _parentPages = [
    const TasksMainScreen(),
    const WaitLoginScreen(),
    const BalanceParentScreen(),
    const ProfileParentScreen(),
  ];

  final List<Widget> _childPages = [
    const TasksMainScreen(),
    const WaitLoginScreen(),
    const BalanceChildScreen(),
    const ProfileChildScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NoConnectionWrapper(
      child: FutureBuilder(
        future: ref.read(userProvider).updateAuthInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            throw Exception(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done ||
              ref.read(userProvider).isLogin) {
            return Scaffold(
              body: ref.watch(userProvider).role == AppSide.parent
                  ? _parentPages[_index]
                  : _childPages[_index],
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
                currentIndex: _index,
                selectedItemColor: Colors.deepPurpleAccent,
                unselectedItemColor: const Color.fromRGBO(106, 105, 105, 1),
                onTap: _onItemTapped,
              ),
            );
          }
          return const WaitLoginScreen();
        },
      ),
    );
  }
}
