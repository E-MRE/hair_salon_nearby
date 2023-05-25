import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import '../constants/hive_constants.dart';
import 'entity_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveConstants.token)
class TokenModel extends EntityModel<TokenModel> {
  final String? accessToken;
  final String? acceptTokenExpiration;

  final String _iso8601Date = '0001-01-01T01:01:01.0000000+00:00';

  TokenModel({this.accessToken, this.acceptTokenExpiration});

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  @override
  TokenModel fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic>? toJson() => _$TokenModelToJson(this);

  DateTime getExpirationDate({bool isUtcToLocal = false, int defaultYear = 1}) {
    try {
      final date = DateTime.parse(acceptTokenExpiration ?? _iso8601Date);
      return isUtcToLocal ? date.toLocal() : date;
    } catch (_) {
      return DateTime(defaultYear);
    }
  }
}
