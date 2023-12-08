// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      cityName: json['cityName'] as String?,
      counties: (json['counties'] as List<dynamic>?)
          ?.map((e) => CountyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'counties': instance.counties,
    };
