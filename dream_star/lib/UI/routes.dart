import 'package:dream_star/UI/ParentSide/Tasks/task_creation_screen.dart';
import 'package:dream_star/UI/Shared/Tasks/tasks_main_screen.dart';
import 'package:dream_star/UI/Shared/pages/welcome_page.dart';

final routes = {
  '/': (context) => const MainHomeScreen(),
  '/tasks': (context) => TasksMainScreen(),
  '/tasks/create': (context) => const TaskCreationScreen(childrenNamesList: ["Никита"])
};