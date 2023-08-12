import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/entity_model.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends EntityModel<UserModel> {
  final String? name;
  final String? surname;

  UserModel({this.name, this.surname});

  @override
  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
