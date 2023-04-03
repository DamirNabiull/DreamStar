import 'dart:ui';

import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/task_info.dart';

class MappingClient {
  TaskInfo taskDTOToTaskInfo(TaskDTO taskDTO) => TaskInfo(
      taskDTO.id,
      taskDTO.title,
      taskDTO.description,
      taskDTO.cost,
      _taskStatusToEnum(taskDTO.status),
      _stringToColor(taskDTO.color),
      taskDTO.childName,
      taskDTO.childId);

  TaskDTO taskInfoToTaskDTO(TaskInfo task) => TaskDTO(
      task.childId,
      task.childName,
      task.title,
      task.description,
      _taskStatusToString(task.status),
      task.cost,
      _colorToString(task.lineColor),
      task.id);

  TaskStatus _taskStatusToEnum(String status) =>
      TaskStatus.values.firstWhere((e) => e.toString() == status);

  String _taskStatusToString(TaskStatus status) => status.toString();

  Color _stringToColor(String color) {
    return const Color(0xFFB6E147);
  }

  String _colorToString(Color color) => color.toString();
}
