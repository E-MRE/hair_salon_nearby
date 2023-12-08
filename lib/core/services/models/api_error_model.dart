import 'package:json_annotation/json_annotation.dart';

import 'entity_model.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
final class ApiErrorModel extends EntityModel<ApiErrorModel> {
  final List<String>? errors;

  const ApiErrorModel({this.errors});

  @override
  List<Object?> get props => [errors];

  @override
  ApiErrorModel fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic>? toJson() => _$ApiErrorModelToJson(this);
}
