import 'package:json_annotation/json_annotation.dart';

import 'entity_model.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
//TODO: Check your api error response model..
class ApiErrorModel extends EntityModel<ApiErrorModel> {
  late List<String>? errors;

  ApiErrorModel({this.errors});

  @override
  ApiErrorModel fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic>? toJson() => _$ApiErrorModelToJson(this);
}
