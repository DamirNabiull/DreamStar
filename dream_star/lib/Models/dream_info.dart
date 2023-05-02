import 'dart:math';
import 'dart:ui';

import 'package:dream_star/UI/themes.dart';

enum DreamStatus { review, approved, await, complete }

class DreamInfo {
  final String id;
  final String title;
  final String description;
  final int cost;
  final DreamStatus status;
  Color lineColor = cardLineColors[Random().nextInt(cardLineColors.length)];
  final String childName;
  final String childId;
  DateTime? createdAt;

  DreamInfo(this.title, this.description, this.cost, this.status, Color? color,
      this.childName, this.childId,
      [this.id = "-1"]) {
    if (color != null) {
      lineColor = color;
    }
  }
}
