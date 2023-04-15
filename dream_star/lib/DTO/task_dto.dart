import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/Helpers/JsonConverter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_dto.g.dart';

@JsonSerializable()
@TimestampOrNullConverter()
class TaskDTO {
  String id;
  final String childId;
  final String childName;
  final String title;
  final String description;
  final String status;
  final int cost;
  final int color;
  DateTime? deadline;
  int? penalty;
  DateTime? createdAt;
  final bool overdue;

  TaskDTO(this.childId, this.childName, this.title, this.description,
      this.status, this.cost, this.color,
      [this.id = "-1",
      this.createdAt,
      this.deadline,
      this.penalty,
      this.overdue = false]);

  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDTOToJson(this);
}
