import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/Clients/providers.dart';
import 'package:dream_star/DTO/dream_dto.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/DTO/user_dto.dart';
import 'package:dream_star/Models/dream_info.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mapping_client.dart';

class FireStoreClient {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference<Map<String, dynamic>> _tasksCollection;
  late final CollectionReference<Map<String, dynamic>> _usersCollection;
  late final CollectionReference<Map<String, dynamic>> _tokensCollection;
  late final CollectionReference<Map<String, dynamic>> _dreamsCollection;

  final container = ProviderContainer();
  late final MappingClient _mapper = container.read(mappingProvider);

  FireStoreClient() {
    _tasksCollection = db.collection("tasks");
    _usersCollection = db.collection("users");
    _tokensCollection = db.collection("tokens");
    _dreamsCollection = db.collection("dreams");
  }

  void createToken(String token, String id, String password) {
    _tokensCollection.doc(token).set({'id': id, 'password': password});
  }

  Future<Map<String, String>?> getIdAndPassByToken(String token) async {
    final snapshot = await _tokensCollection.doc(token).get();
    if (snapshot.exists) {
      var data = snapshot.data()!;
      return {'id': data['id'], 'password': data['password']};
    }
    return null;
  }

  Future<String?> getTokenById(String id) async {
    return await _tokensCollection.where('id', isEqualTo: id).get().then(
      (querySnapshot) {
        return querySnapshot.docs[0].id;
      },
      onError: (e) => null,
    );
  }

  bool isTokenFree(String token) {
    bool ans = true;
    _tokensCollection
        .doc(token)
        .get()
        .then((value) => ans = false)
        .onError((error, stackTrace) => ans = true);
    return ans;
  }

  void createTask(TaskInfo taskInfo) async {
    final taskDTO = _mapper.taskInfoToTaskDTO(taskInfo);
    final taskRef = _tasksCollection.doc();
    taskDTO.id = taskRef.id;

    await taskRef.set(taskDTO.toJson());
  }

  void updateTaskStatus(
      String taskId, TaskStatus status, bool isOverdue) async {
    final taskRef = _tasksCollection.doc(taskId);
    taskRef.update({"status": status.toString(), 'overdue': isOverdue});
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

  void createDream(DreamInfo dreamInfo) async {
    final dreamDTO = _mapper.dreamInfoToDreamDTO(dreamInfo);
    final dreamRef = _dreamsCollection.doc();
    dreamDTO.id = dreamRef.id;

    await dreamRef.set(dreamDTO.toJson());
  }

  void updateDreamStatus(String dreamId, DreamStatus status, int cost) async {
    final dreamRef = _dreamsCollection.doc(dreamId);
    dreamRef.update({"status": status.toString(), 'cost': cost});
  }

  Stream<List<DreamInfo>> getDreams(
      List<String> childIds, List<DreamStatus> statusList) {
    if (childIds.isNotEmpty) {
      List<String> statuses = [];
      for (var status in statusList) {
        statuses.add(status.toString());
      }
      return _dreamsCollection
          .where("childId", whereIn: childIds)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .where((doc) => statuses.contains(doc['status']))
              .map((doc) =>
                  _mapper.dreamDTOToDreamInfo(DreamDTO.fromJson(doc.data())))
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

  Future<void> updateStars(String id, int stars) async {
    final user = _usersCollection.doc(id);
    final snapshot = await user.get();
    final userDTO = UserDTO.fromJson(snapshot.data()!);
    user.update({'stars': userDTO.stars! + stars});
  }
}
