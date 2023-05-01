import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/DTO/user_dto.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mapping_client.dart';

class FireStoreClient {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference<Map<String, dynamic>> _tasksCollection;
  late final CollectionReference<Map<String, dynamic>> _usersCollection;
  // late final CollectionReference<Map<String, dynamic>> _dreamsCollection;

  final container = ProviderContainer();
  late final MappingClient _mapper = container.read(mappingProvider);

  FireStoreClient() {
    _tasksCollection = db.collection("tasks");
    _usersCollection = db.collection("users");
    // _dreamsCollection = db.collection("dreams");
  }

  void createTask(TaskInfo taskInfo) async {
    final taskDTO = _mapper.taskInfoToTaskDTO(taskInfo);
    final taskRef = _tasksCollection.doc();
    taskDTO.id = taskRef.id;

    await taskRef.set(taskDTO.toJson());
  }

  void updateTaskStatus(String taskId, TaskStatus status) async {
    final taskRef = _tasksCollection.doc(taskId);
    taskRef.update({"status": status.toString()});
  }

  Stream<List<TaskInfo>> getTasks(List<String> childIds, TaskStatus status) {
    if (childIds.isNotEmpty) {
      return _tasksCollection
          .where("childId", whereIn: childIds)
          .where("status", isEqualTo: status.toString())
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) =>
                  _mapper.taskDTOToTaskInfo(TaskDTO.fromJson(doc.data())))
              .toList());
    }
    return const Stream.empty();
  }

  void createUser(UserDTO userDTO, String id) {
    _usersCollection.doc(id).set(userDTO.toJson());
  }

  Future<UserDTO?> getUser(String id) async {
    final snapshot = await _usersCollection.doc(id).get();
    if (snapshot.exists) {
      return UserDTO.fromJson(snapshot.data()!);
    }
    return null;
  }

  void updateUser(UserDTO userDTO, String id) {
    final user = _usersCollection.doc(id);
    user.update(userDTO.toJson());
  }
}