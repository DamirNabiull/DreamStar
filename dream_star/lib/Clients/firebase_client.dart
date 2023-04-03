import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import 'mapping_client.dart';

class FireStoreClient {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference<Map<String, dynamic>> _tasksCollection;
  late final CollectionReference<Map<String, dynamic>> _dreamsCollection;

  final container = ProviderContainer();
  late final MappingClient _mapper = container.read(mappingProvider);

  FireStoreClient() {
    _tasksCollection = db.collection("tasks");
    _dreamsCollection = db.collection("dreams");
  }

  void createTask(TaskDTO taskDTO) async {
    final taskRef = _tasksCollection.doc();
    taskDTO.id = taskRef.id;

    await taskRef.set(taskDTO.toJson());
  }

  void createTestTasks() async {
    var titles = [
      "Постирать вещи",
      "Сделать ДЗ",
      "Пропылесосить дом",
      "Выгулять собаку",
      "Помыть посуду",
      "Сходить в магазин",
      "Расписание в дневнике"
    ];
    var descriptions = [
      "Собери свои белые вещи и белые вещи из контейнера с грязными вещами, режим на машинке поставь \"Хлопок\", порошок для белых вещей лежит в шкафу.",
      "Сделай домашку до моего прихода, когда приду и проверю - получишь свою звёздочку.",
      "Пропылесось, пожалуйста, все комнаты, и не забудь про ванную и туалет.",
      "Выгуляй Персика, пожалуйста, и не забудь помыть ему лапки, как домой зайдёте.",
      "Помой посуду, после того, как поешь. Курица с рисом в холодильнике.",
      "Купи молоко, батон, сыр, конфеты какие-нибудь, печенье и макароны.",
      "Заполни дневник на две недели вперёд."
    ];

    var statuses = [TaskStatus.progress, TaskStatus.review, TaskStatus.passed];

    for (var i = 0; i < 42; i++) {
      var taskRef = _tasksCollection.doc();

      TaskDTO task = TaskDTO("test$i", "test$i", titles[i%7], descriptions[i%7],
          statuses[(i ~/ 7) % 3].toString(), i % 11 + 1, "test$i", taskRef.id);

      taskRef.set(task.toJson());
    }
  }

  void updateTaskStatus(String taskId, TaskStatus status) async {
    final taskRef = _tasksCollection.doc(taskId);
    taskRef.update({"status": status.toString()});
  }

  Stream<List<TaskInfo>> getTasks(List<String> childIds, TaskStatus status) {
    if (childIds.length <= 10) {
      return _tasksCollection
          .where("childId", whereIn: childIds)
          .where("status", isEqualTo: status.toString())
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) =>
          _mapper.taskDTOToTaskInfo(TaskDTO.fromJson(doc.data())))
          .toList());
    }
    else {
      var stream1 = _tasksCollection
          .where("childId", whereIn: childIds.sublist(0, 10))
          .where("status", isEqualTo: status.toString())
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) =>
          _mapper.taskDTOToTaskInfo(TaskDTO.fromJson(doc.data())))
          .toList());
      var stream2 = getTasks(childIds.sublist(10), status);
      return Rx.zip2(
        stream1,
        stream2,
            (a, b) => a + b,
      );
    }
  }

  Stream<List<TaskInfo>> getAllTasks() {
    return _tasksCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => _mapper.taskDTOToTaskInfo(TaskDTO.fromJson(doc.data())))
        .toList());
  }
}