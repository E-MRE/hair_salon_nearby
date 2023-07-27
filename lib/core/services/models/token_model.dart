import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/hive_constants.dart';
import 'entity_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveConstants.token)
class TokenModel extends EntityModel<TokenModel> {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final String? refreshToken;
  @HiveField(2)
  final String? expirationDate;
  @HiveField(3)
  final String? refreshExpirationDate;

  TokenModel({this.token, this.refreshToken, this.expirationDate, this.refreshExpirationDate});

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  @override
  TokenModel fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic>? toJson() => _$TokenModelToJson(this);
}
