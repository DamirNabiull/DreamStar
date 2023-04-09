import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/UI/Shared/Tasks/tasks_main_screen.dart';
import 'package:dream_star/UI/Shared/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tasksScreenRoute = MaterialPageRoute(
  builder: (BuildContext context) => const TasksMainScreen(),
);

class InitPage extends ConsumerWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.read(userProvider).isAuth
        ? const TasksMainScreen()
        : const MainHomeScreen();
  }
}
