// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamDTO _$DreamDTOFromJson(Map<String, dynamic> json) => DreamDTO(
      json['title'] as String,
      json['description'] as String,
      json['cost'] as int,
      json['status'] as String,
      json['color'] as int,
      json['childName'] as String,
      json['childId'] as String,
      json['id'] as String? ?? "-1",
    )..createdAt = const TimestampOrNullConverter()
        .fromJson(json['createdAt'] as Timestamp?);

Map<String, dynamic> _$DreamDTOToJson(DreamDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'cost': instance.cost,
      'status': instance.status,
      'color': instance.color,
      'childName': instance.childName,
      'childId': instance.childId,
      'createdAt': const TimestampOrNullConverter().toJson(instance.createdAt),
    };
