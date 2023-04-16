// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDTO _$TaskDTOFromJson(Map<String, dynamic> json) => TaskDTO(
      json['childId'] as String,
      json['childName'] as String,
      json['title'] as String,
      json['description'] as String,
      json['status'] as String,
      json['cost'] as int,
      json['color'] as int,
      json['id'] as String? ?? "-1",
      const TimestampOrNullConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      const TimestampOrNullConverter().fromJson(json['deadline'] as Timestamp?),
      json['penalty'] as int?,
      json['overdue'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskDTOToJson(TaskDTO instance) => <String, dynamic>{
      'id': instance.id,
      'childId': instance.childId,
      'childName': instance.childName,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'cost': instance.cost,
      'color': instance.color,
      'deadline': const TimestampOrNullConverter().toJson(instance.deadline),
      'penalty': instance.penalty,
      'createdAt': const TimestampOrNullConverter().toJson(instance.createdAt),
      'overdue': instance.overdue,
    };
