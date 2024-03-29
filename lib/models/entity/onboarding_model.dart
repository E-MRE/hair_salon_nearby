import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/entity_model.dart';
import '../../utils/enum/gender.dart';
import 'theme_model.dart';

part 'onboarding_model.g.dart';

@JsonSerializable(createToJson: false)
final class OnboardingModel extends EntityModel<OnboardingModel> {
  final String? name;
  final String? description;
  final String imageUrl;
  final ThemeModel? theme;
  final Gender gender;

  const OnboardingModel({
    this.name,
    this.description,
    required this.imageUrl,
    this.theme,
    required this.gender,
  });

  @override
  List<Object?> get props => [name, description, imageUrl, theme, gender];

  @override
  OnboardingModel fromJson(Map<String, dynamic> json) => _$OnboardingModelFromJson(json);

  factory OnboardingModel.fromJson(Map<String, dynamic> json) => _$OnboardingModelFromJson(json);
}
