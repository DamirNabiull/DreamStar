import 'dart:ui';

enum TaskStatus {
  progress, review, passed;
}

class TaskInfo {
  String title;
  String description;
  int cost;
  TaskStatus status;
  Color lineColor;
  bool overdue = false;
  String? childName;
  DateTime? deadline;
  int? penalty;


  TaskInfo(this.title, this.description, this.cost, this.status, this.lineColor, [this.childName, this.deadline, this.penalty]);
}