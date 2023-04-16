import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  final String name;
  final String surname;
  final String lastname;
  final bool isParent;
  List<String>? children;
  int? stars;

  UserDTO(this.name, this.surname, this.lastname, this.isParent, [this.children, this.stars]);

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
