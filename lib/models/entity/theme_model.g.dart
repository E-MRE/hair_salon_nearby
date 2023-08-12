// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) => ThemeModel(
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      primaryColor: json['colorOne'] as String?,
      secondaryColor: json['colorTwo'] as String?,
      alternativeColor: json['colorThree'] as String?,
    );

const _$GenderEnumMap = {
  Gender.man: 0,
  Gender.woman: 1,
};
