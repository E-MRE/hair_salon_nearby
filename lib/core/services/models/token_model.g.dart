// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expirationDate: json['expirationDate'] as String?,
      refreshExpirationDate: json['refreshExpirationDate'] as String?,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'expirationDate': instance.expirationDate,
      'refreshExpirationDate': instance.refreshExpirationDate,
    };
