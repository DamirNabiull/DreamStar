// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      json['name'] as String,
      json['surname'] as String,
      json['lastname'] as String,
      json['isParent'] as bool,
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['stars'] as int?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'lastname': instance.lastname,
      'isParent': instance.isParent,
      'children': instance.children,
      'stars': instance.stars,
    };
