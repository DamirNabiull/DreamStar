import 'dart:ui';

import 'package:dream_star/DTO/dream_dto.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/dream_info.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/themes.dart';

class MappingClient {
  TaskInfo taskDTOToTaskInfo(TaskDTO taskDTO) => TaskInfo(
      taskDTO.title,
      taskDTO.description,
      taskDTO.cost,
      _taskStatusToEnum(taskDTO.status),
      _stringToColor(taskDTO.color),
      taskDTO.childName,
      taskDTO.childId,
      taskDTO.id,
      taskDTO.createdAt,
      taskDTO.deadline,
      taskDTO.penalty,
      taskDTO.overdue);

  TaskDTO taskInfoToTaskDTO(TaskInfo task) => TaskDTO(
      task.childId,
      task.childName,
      task.title,
      task.description,
      _taskStatusToString(task.status),
      task.cost,
      _colorToInt(task.lineColor),
      task.id,
      task.createdAt,
      task.deadline,
      task.penalty,
      task.overdue);

  TaskStatus _taskStatusToEnum(String status) =>
      TaskStatus.values.firstWhere((e) => e.toString() == status);

  String _taskStatusToString(TaskStatus status) => status.toString();

  DreamInfo dreamDTOToDreamInfo(DreamDTO dreamDTO) => DreamInfo(
        dreamDTO.title,
        dreamDTO.description,
        dreamDTO.cost,
        _dreamStatusToEnum(dreamDTO.status),
        _stringToColor(dreamDTO.color),
        dreamDTO.childName,
        dreamDTO.childId,
        dreamDTO.id,
      );

  DreamDTO dreamInfoToDreamDTO(DreamInfo dream) => DreamDTO(
        dream.title,
        dream.description,
        dream.cost,
        _dreamStatusToString(dream.status),
        _colorToInt(dream.lineColor),
        dream.childName,
        dream.childId,
        dream.id,
      );

  DreamStatus _dreamStatusToEnum(String status) =>
      DreamStatus.values.firstWhere((e) => e.toString() == status);

  String _dreamStatusToString(DreamStatus status) => status.toString();

  Color _stringToColor(int color) => cardLineColors[color];

  int _colorToInt(Color color) => cardLineColors.indexOf(color);
}
