import 'dart:math';
import 'dart:ui';

import 'package:dream_star/UI/themes.dart';

enum TaskStatus {
  progress,
  review,
  passed;
}

class TaskInfo {
  final String id;
  final String title;
  final String description;
  final int cost;
  final TaskStatus status;
  Color lineColor = cardLineColors[Random().nextInt(cardLineColors.length)];
  bool overdue = false;
  final String childName;
  final String childId;
  DateTime? deadline;
  int? penalty;

  TaskInfo(this.id, this.title, this.description, this.cost, this.status,
      Color? color, this.childName, this.childId,
      [this.deadline, this.penalty]) {
    if (color != null) {
      lineColor = color;
    }
  }
}
