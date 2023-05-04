import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_star/Helpers/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dream_dto.g.dart';

@JsonSerializable()
@TimestampOrNullConverter()
class DreamDTO {
  String id;
  final String title;
  final String description;
  final int cost;
  final String status;
  final int color;
  final String childName;
  final String childId;
  DateTime? createdAt;

  DreamDTO(this.title, this.description, this.cost, this.status, this.color,
      this.childName, this.childId,
      [this.id = "-1"]);

  factory DreamDTO.fromJson(Map<String, dynamic> json) =>
      _$DreamDTOFromJson(json);
  Map<String, dynamic> toJson() => _$DreamDTOToJson(this);
}