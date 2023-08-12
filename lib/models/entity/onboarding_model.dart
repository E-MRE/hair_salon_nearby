import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/entity_model.dart';
import '../../utils/enum/gender.dart';
import 'theme_model.dart';

part 'onboarding_model.g.dart';

@JsonSerializable(createToJson: false)
class OnboardingModel extends EntityModel<OnboardingModel> {
  final String? name;
  final String? description;
  final String imageUrl;
  final ThemeModel? theme;
  final Gender gender;

  OnboardingModel({
    this.name,
    this.description,
    required this.imageUrl,
    this.theme,
    required this.gender,
  });

  @override
  OnboardingModel fromJson(Map<String, dynamic> json) => _$OnboardingModelFromJson(json);

  factory OnboardingModel.fromJson(Map<String, dynamic> json) => _$OnboardingModelFromJson(json);
}
