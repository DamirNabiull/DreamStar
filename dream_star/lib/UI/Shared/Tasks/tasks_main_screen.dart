import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/Components/top_app_bar.dart';
import 'package:dream_star/UI/Shared/Connection/no_connection_wrapper.dart';
import 'package:dream_star/UI/Shared/Login/wait_login_screen.dart';
import 'package:dream_star/UI/Shared/Tasks/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

class TasksMainScreen extends ConsumerWidget {
  const TasksMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NoConnectionWrapper(
      child: FutureBuilder(
        future: ref.read(userProvider).updateAuthInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            throw Exception(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: TopAppBar(
                  context,
                  'tasks-screen-title'.i18n(),
                  [
                    'tasks-progress-title'.i18n(),
                    'tasks-review-title'.i18n(),
                    'tasks-passed-title'.i18n()
                  ],
                  ref.read(userProvider).role!,
                ),
                body: TabBarView(
                  children: [
                    TaskListScreen(
                        ref.read(userProvider).role!, TaskStatus.progress),
                    TaskListScreen(
                        ref.read(userProvider).role!, TaskStatus.review),
                    TaskListScreen(
                        ref.read(userProvider).role!, TaskStatus.passed)
                  ],
                ),
              ),
            );
          }
          return const WaitLoginScreen();
        },
      ),
    );
  }
}
