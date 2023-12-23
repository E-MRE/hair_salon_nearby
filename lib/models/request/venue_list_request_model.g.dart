// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_list_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$VenueListRequestModelToJson(
        VenueListRequestModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'search': instance.search,
      'cityCountyId': instance.cityCountyId,
      'longitute': instance.longitude,
      'latitute': instance.latitude,
      'venueType': _$VenueTypeEnumMap[instance.venueType],
    };

const _$VenueTypeEnumMap = {
  VenueType.man: 0,
  VenueType.woman: 1,
  VenueType.mixed: 2,
};
