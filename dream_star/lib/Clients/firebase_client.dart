import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/DTO/task_dto.dart';
import 'package:dream_star/Models/task_info.dart';
import 'package:riverpod/riverpod.dart';

import 'mapping_client.dart';

class FireStoreClient {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference<Map<String, dynamic>> _tasksCollection;
  late final CollectionReference<Map<String, dynamic>> _dreamsCollection;
  
  final container = ProviderContainer();
  late final MappingClient _mapper = container.read(mappingProvider);

  FireStoreClient(){
    _tasksCollection = db.collection("tasks");
    _dreamsCollection = db.collection("dreams");
  }

  void createTask(TaskDTO taskDTO) async {
    final docRef = _tasksCollection.doc();
    taskDTO.id = docRef.id;

    await docRef.set(taskDTO.toJson());
  }

  Stream<List<TaskInfo>> getTasks(List<String> childIds) {
    return _tasksCollection
        .where("childId", whereIn: childIds)
        .snapshots()
        .map((snapshot) =>
          snapshot.docs.map((doc) =>
              _mapper.taskDTOToTaskInfo(
                  TaskDTO.fromJson(doc.data())
              ))
          .toList());
  }
}

final fireStoreProvider = Provider((ref) => FireStoreClient());