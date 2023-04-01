// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDTO _$TaskDTOFromJson(Map<String, dynamic> json) => TaskDTO(
      childId: json['childId'] as String,
      childName: json['childName'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      cost: json['cost'] as int,
      color: json['color'] as String,
    )..id = json['id'] as String;

Map<String, dynamic> _$TaskDTOToJson(TaskDTO instance) => <String, dynamic>{
      'id': instance.id,
      'childId': instance.childId,
      'childName': instance.childName,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'cost': instance.cost,
      'color': instance.color,
    };
