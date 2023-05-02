// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dream_star/Clients/mapping_client.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:dream_star/UI/themes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Mapper test', () {
    final mapper = MappingClient();

    TaskInfo taskInfo = TaskInfo('title', 'description', 0, TaskStatus.passed,
        cardLineColors[0], 'childName', 'childId');
    TaskDTO taskDTO = TaskDTO('childId', 'childName', 'title', 'description',
        'TaskStatus.passed', 0, 0);

    TaskDTO mappedInfo = mapper.taskInfoToTaskDTO(taskInfo);
    expect(mappedInfo.id, taskDTO.id);

    TaskInfo mappedDTO = mapper.taskDTOToTaskInfo(taskDTO);
    expect(mappedDTO.id, taskInfo.id);
  });
}
