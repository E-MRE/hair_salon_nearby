import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/entity_model.dart';
import '../../utils/enum/gender.dart';

part 'theme_model.g.dart';

@JsonSerializable(createToJson: false)
final class ThemeModel extends EntityModel<ThemeModel> {
  final Gender? gender;
  @JsonKey(name: 'colorOne')
  final String? primaryColor;
  @JsonKey(name: 'colorTwo')
  final String? secondaryColor;
  @JsonKey(name: 'colorThree')
  final String? alternativeColor;
  const ThemeModel({
    this.gender,
    this.primaryColor,
    this.secondaryColor,
    this.alternativeColor,
  });

  @override
  List<Object?> get props => [gender, primaryColor, secondaryColor, alternativeColor];

  @override
  ThemeModel fromJson(Map<String, dynamic> json) => _$ThemeModelFromJson(json);

  factory ThemeModel.fromJson(Map<String, dynamic> json) => _$ThemeModelFromJson(json);
}
