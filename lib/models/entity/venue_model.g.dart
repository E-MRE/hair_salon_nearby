// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueModel _$VenueModelFromJson(Map<String, dynamic> json) => VenueModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      info: json['info'] as String?,
      motto: json['motto'] as String?,
      image: json['image'] as String?,
      longitude: json['longitute'] as num?,
      latitude: json['latitute'] as num?,
      distance: json['distance'] as num?,
      star: json['star'] as num?,
      venueType: $enumDecodeNullable(_$VenueTypeEnumMap, json['venueType']),
    );

const _$VenueTypeEnumMap = {
  VenueType.man: 0,
  VenueType.woman: 1,
  VenueType.mixed: 2,
};
