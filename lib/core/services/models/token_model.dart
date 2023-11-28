import 'package:json_annotation/json_annotation.dart';

import 'local_storage_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends LocalStorageModel<TokenModel> {
  final String? token;
  final String? refreshToken;
  final String? expirationDate;
  final String? refreshExpirationDate;

  TokenModel({this.token, this.refreshToken, this.expirationDate, this.refreshExpirationDate});

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  @override
  TokenModel fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
