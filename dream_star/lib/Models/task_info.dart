import 'dart:ui';

enum TaskStatus {
  progress, review, passed;
}

class TaskInfo {
  final String title;
  final String description;
  final int cost;
  final TaskStatus status;
  Color lineColor;
  bool overdue = false;
  final String childName;
  final String childId;
  DateTime? deadline;
  int? penalty;


  TaskInfo(
      this.title,
      this.description,
      this.cost,
      this.status,
      this.lineColor,
      this.childName,
      this.childId,
      [
        this.deadline,
        this.penalty
      ]);
}