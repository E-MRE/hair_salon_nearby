// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingModel _$OnboardingModelFromJson(Map<String, dynamic> json) =>
    OnboardingModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String,
      theme: json['theme'] == null
          ? null
          : ThemeModel.fromJson(json['theme'] as Map<String, dynamic>),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    );

const _$GenderEnumMap = {
  Gender.man: 0,
  Gender.woman: 1,
};
