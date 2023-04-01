import 'package:json_annotation/json_annotation.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDTO {
  String id = "-1";
  final String childId;
  final String childName;
  final String title;
  final String description;
  final String status;
  final int cost;
  final String color;

  TaskDTO({
    required this.childId,
    required this.childName,
    required this.title,
    required this.description,
    required this.status,
    required this.cost,
    required this.color
  });

  factory TaskDTO.fromJson(Map<String, dynamic> json) => _$TaskDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDTOToJson(this);
}