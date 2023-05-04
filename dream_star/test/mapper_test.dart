// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dream_star/Clients/mapping_client.dart';
import 'package:dream_star/DTO/dream_dto.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/dream_info.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Task mapper test', () {
    final mapper = MappingClient();

    TaskInfo taskInfo = TaskInfo('title', 'description', 0, TaskStatus.passed,
        cardLineColors[0], 'childName', 'childId');
    TaskDTO taskDTO = TaskDTO('childId', 'childName', 'title', 'description',
        'TaskStatus.passed', 0, 0);

    TaskDTO mappedInfo = mapper.taskInfoToTaskDTO(taskInfo);
    expect(mappedInfo.id, taskDTO.id);
    expect(mappedInfo.title, taskDTO.title);
    expect(mappedInfo.description, taskDTO.description);
    expect(mappedInfo.cost, taskDTO.cost);
    expect(mappedInfo.status, taskDTO.status);
    expect(mappedInfo.color, taskDTO.color);
    expect(mappedInfo.childName, taskDTO.childName);
    expect(mappedInfo.childId, taskDTO.childId);

    TaskInfo mappedDTO = mapper.taskDTOToTaskInfo(taskDTO);
    expect(mappedDTO.id, taskInfo.id);
    expect(mappedDTO.title, taskInfo.title);
    expect(mappedDTO.description, taskInfo.description);
    expect(mappedDTO.cost, taskInfo.cost);
    expect(mappedDTO.status, taskInfo.status);
    expect(mappedDTO.lineColor, taskInfo.lineColor);
    expect(mappedDTO.childName, taskInfo.childName);
    expect(mappedDTO.childId, taskInfo.childId);
  });

  test('Task mapper test', () {
    final mapper = MappingClient();

    DreamInfo dreamInfo = DreamInfo('title', 'description', 0,
        DreamStatus.complete, cardLineColors[0], 'childName', 'childId');
    DreamDTO dreamDTO = DreamDTO('title', 'description', 0,
        'DreamStatus.complete', 0, 'childName', 'childId');

    DreamDTO mappedInfo = mapper.dreamInfoToDreamDTO(dreamInfo);
    expect(mappedInfo.id, dreamDTO.id);
    expect(mappedInfo.title, dreamDTO.title);
    expect(mappedInfo.description, dreamDTO.description);
    expect(mappedInfo.cost, dreamDTO.cost);
    expect(mappedInfo.status, dreamDTO.status);
    expect(mappedInfo.color, dreamDTO.color);
    expect(mappedInfo.childName, dreamDTO.childName);
    expect(mappedInfo.childId, dreamDTO.childId);

    DreamInfo mappedDTO = mapper.dreamDTOToDreamInfo(dreamDTO);
    expect(mappedDTO.id, dreamInfo.id);
    expect(mappedDTO.title, dreamInfo.title);
    expect(mappedDTO.description, dreamInfo.description);
    expect(mappedDTO.cost, dreamInfo.cost);
    expect(mappedDTO.status, dreamInfo.status);
    expect(mappedDTO.lineColor, dreamInfo.lineColor);
    expect(mappedDTO.childName, dreamInfo.childName);
    expect(mappedDTO.childId, dreamInfo.childId);
  });
}
