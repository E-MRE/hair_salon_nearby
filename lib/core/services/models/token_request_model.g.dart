// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenRequestModel _$TokenRequestModelFromJson(Map<String, dynamic> json) =>
    TokenRequestModel(
      clientId: json['clientId'] as String,
      clientSecret: json['clientSecret'] as String,
    );

Map<String, dynamic> _$TokenRequestModelToJson(TokenRequestModel instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
    };
