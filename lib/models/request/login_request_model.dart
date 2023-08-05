import '../../core/services/models/api_request_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequestModel extends ApiRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
