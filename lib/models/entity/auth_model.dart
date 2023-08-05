import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/entity_model.dart';
import '../../core/services/models/token_model.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthModel extends TokenModel implements EntityModel<TokenModel> {
  AuthModel({super.expirationDate, super.refreshExpirationDate, super.refreshToken, super.token});
  @override
  AuthModel fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
}
