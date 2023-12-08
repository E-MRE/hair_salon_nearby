import 'package:hair_salon_nearby/core/services/models/entity_model.dart';
import 'package:hair_salon_nearby/core/services/models/local_storage_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'county_model.g.dart';

@JsonSerializable()
class CountyModel extends EntityModel<CountyModel> implements LocalStorageModel<CountyModel> {
  final String? countyName;
  final int? id;

  CountyModel({this.countyName, this.id});

  factory CountyModel.fromJson(Map<String, dynamic> json) => _$CountyModelFromJson(json);

  @override
  CountyModel fromJson(Map<String, dynamic> json) => CountyModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CountyModelToJson(this);
}
