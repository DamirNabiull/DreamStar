import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/Components/top_app_bar.dart';
import 'package:dream_star/UI/Shared/Tasks/task_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

class TasksMainScreen extends ConsumerWidget {
  const TasksMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSide = ref.read(userProvider).getUserRole();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TopAppBar('tasks-screen-title'.i18n(), [
            'tasks-progress-title'.i18n(),
            'tasks-review-title'.i18n(),
            'tasks-passed-title'.i18n()
          ]),
          body: TabBarView(
            children: [
              // Container(color: Colors.orange),
              // Container(color: Colors.yellow),
              // Container(color: Colors.redAccent)
              TaskListScreen(appSide, TaskStatus.progress),
              TaskListScreen(appSide, TaskStatus.review),
              TaskListScreen(appSide, TaskStatus.passed)
            ],
          ),
        ));
  }
}
