import 'dart:ui';

import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/task_info.dart';

class MappingClient {
  TaskInfo taskDTOToTaskInfo(TaskDTO taskDTO) =>
      TaskInfo(
          taskDTO.title,
          taskDTO.description,
          taskDTO.cost,
          _taskStatusToEnum(taskDTO.status),
          _stringToColor(taskDTO.color),
          taskDTO.childName,
          taskDTO.childId
      );

  TaskDTO taskInfoToTaskDTO(TaskInfo task) =>
      TaskDTO(
          childId: task.childId,
          childName: task.childName,
          title: task.title,
          description: task.description,
          status: _taskStatusToString(task.status),
          cost: task.cost,
          color: _colorToString(task.lineColor)
      );

  TaskStatus _taskStatusToEnum(String status) =>
      TaskStatus.values.firstWhere(
              (e) => e.toString() == 'TaskStatus.$status'
      );

  String _taskStatusToString(TaskStatus status) => status.toString();

  Color _stringToColor(String color) {
    return const Color(0xFFB6E147);
  }

  String _colorToString(Color color) => color.toString();
}