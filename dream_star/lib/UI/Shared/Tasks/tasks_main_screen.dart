import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/Components/top_app_bar.dart';
import 'package:dream_star/UI/Shared/Tasks/task_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class TasksMainScreen extends StatelessWidget {
  final AppSide _appSide = AppSide.parent;

  final List<String> tabNames = const [
    "Задачи",
    "Задачи на проверке",
    "Выполненные задачи"
  ];

  const TasksMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabNames.length,
        child: Scaffold(
          appBar: TopAppBar('tasks-screen-title'.i18n(), tabNames),
          body: TabBarView(
            children: [
              TaskListScreen(_appSide, TaskStatus.progress),
              TaskListScreen(_appSide, TaskStatus.review),
              TaskListScreen(_appSide, TaskStatus.passed)
            ],
          ),
        ));
  }
}
