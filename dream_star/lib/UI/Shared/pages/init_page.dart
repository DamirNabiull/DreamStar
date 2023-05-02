import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/Shared/Login/wait_login_screen.dart';
import 'package:dream_star/UI/Shared/Tasks/tasks_main_screen.dart';
import 'package:dream_star/UI/Shared/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitPage extends ConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // only for debug
    // print("REMOVE SIGN OUT IN INIT PAGE");

    // REMOVE WHEN EXIT BUTTON WILL BE CREATED

    return FutureBuilder(
      future: ref.read(userProvider).signOut(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw Exception(snapshot.error.toString());
        }
        return const MainHomeScreen();
      },
    );

    return StreamBuilder<User?>(
      stream: ref.read(userProvider).authState(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw Exception(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return const TasksMainScreen();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const WaitLoginScreen();
        }

        return const MainHomeScreen();
      },
    );
  }
}