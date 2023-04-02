import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Clients/providers.dart';
import 'Models/app_side.dart';
import 'UI/Components/task_card.dart';
import 'UI/themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      home: const HomeView(),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tasksStream = ref.read(fireStoreProvider).getAllTasks();
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
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TaskCard(
                          appSide: AppSide.child,
                          taskInfo: tasks[index]
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
