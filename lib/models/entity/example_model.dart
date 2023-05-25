import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/api_request_model.dart';
import '../../core/services/models/entity_model.dart';

part 'example_model.g.dart';

//toJson fromJson kullanmak için `JsonSerializable` paketinden yardım alıyoruz.
@JsonSerializable()
class ExampleModel extends EntityModel<ExampleModel> implements ApiRequestModel {
  int? id;
  String? name;

  ExampleModel({this.id, this.name});

  factory ExampleModel.fromJson(Map<String, dynamic> json) => _$ExampleModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);

  @override
  ExampleModel fromJson(Map<String, dynamic> json) => _$ExampleModelFromJson(json);
}
