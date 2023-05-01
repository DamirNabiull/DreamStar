import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/Models/app_side.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/Components/task_card.dart';
import 'package:dream_star/UI/Shared/NoChildAdded/no_child_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListScreen extends ConsumerWidget {
  final TaskStatus _taskStatus;
  final AppSide _appSide;

  const TaskListScreen(this._appSide, this._taskStatus, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksStream = ref.watch(fireStoreProvider).getTasks(
          ref.read(userProvider).childrenList(),
          _taskStatus,
        );
    return Scaffold(
      body: StreamBuilder(
        stream: tasksStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error occurred");
          } else if (snapshot.hasData) {
            final tasks = snapshot.data!;
            return SizedBox(
              height: double.infinity,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 12),
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaskCard(appSide: _appSide, taskInfo: tasks[index])
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
            return const NoChildScreen();
          }
        },
      ),
    );
  }
}
