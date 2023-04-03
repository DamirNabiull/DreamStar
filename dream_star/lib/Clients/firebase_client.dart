import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void updateTaskStatus(String taskId, TaskStatus status) async {
    final taskRef = _tasksCollection.doc(taskId);
    taskRef.update({"status": status.toString()});
  }

  Stream<List<TaskInfo>> getTasks(List<String> childIds, TaskStatus status) {
    return _tasksCollection
        .where("childId", whereIn: childIds)
        .where("status", isEqualTo: status.toString())
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                _mapper.taskDTOToTaskInfo(TaskDTO.fromJson(doc.data())))
            .toList());
  }

  Stream<List<TaskInfo>> getAllTasks() {
    return _tasksCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => _mapper.taskDTOToTaskInfo(TaskDTO.fromJson(doc.data())))
        .toList());
  }
}
