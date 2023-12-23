import 'package:hair_salon_nearby/core/services/models/entity_model.dart';
import 'package:hair_salon_nearby/utils/enum/venue_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venue_model.g.dart';

@JsonSerializable(createToJson: false)
final class VenueModel extends EntityModel<VenueModel> {
  final int? id;
  final String? name;
  final String? info;
  final String? motto;
  final String? image;
  @JsonKey(name: 'longitute')
  final num? longitude;
  @JsonKey(name: 'latitute')
  final num? latitude;
  final num? distance;
  final num? star;
  final VenueType? venueType;

  const VenueModel({
    this.id,
    this.name,
    this.info,
    this.motto,
    this.image,
    this.longitude,
    this.latitude,
    this.distance,
    this.star,
    this.venueType,
  });

  factory VenueModel.fromJson(Map<String, dynamic> json) => _$VenueModelFromJson(json);

  @override
  VenueModel fromJson(Map<String, dynamic> json) => VenueModel.fromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        info,
        motto,
        image,
        longitude,
        latitude,
        distance,
        star,
        venueType,
      ];
}
