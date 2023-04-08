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
  final int color;

  TaskDTO(this.childId, this.childName, this.title, this.description,
      this.status, this.cost, this.color,
      [this.id = "-1"]);

  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDTOToJson(this);
}
