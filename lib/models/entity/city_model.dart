import 'package:hair_salon_nearby/core/services/models/entity_model.dart';
import 'package:hair_salon_nearby/core/services/models/local_storage_model.dart';
import 'package:hair_salon_nearby/models/entity/county_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
final class CityModel extends EntityModel<CityModel> implements LocalStorageModel<CityModel> {
  final String? cityName;
  final List<CountyModel>? counties;

  const CityModel({this.cityName, this.counties});

  @override
  CityModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  List<Object?> get props => [cityName];
}
