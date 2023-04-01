import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/DTO/task_dto.dart';

class FireStoreClient {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference<Map<String, dynamic>> tasksCollection;
  late final CollectionReference<Map<String, dynamic>> dreamsCollection;

  FireStoreClient(){
    tasksCollection = db.collection("tasks");
    dreamsCollection = db.collection("dreams");
  }

  void createTask(TaskDTO taskDTO) async {
    final docRef = tasksCollection.doc();
    taskDTO.id = docRef.id;

    await docRef.set(taskDTO.toJson());
  }

  Stream<List<TaskDTO>> getTasks(List<String> childIds) {
    return tasksCollection
        .where("childId", whereIn: childIds)
        .snapshots()
        .map((snapshot) =>
          snapshot.docs.map((doc) =>
              TaskDTO.fromJson(doc.data()))
          .toList());
  }
}