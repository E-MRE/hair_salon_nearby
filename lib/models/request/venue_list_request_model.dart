import 'package:hair_salon_nearby/core/services/models/api_request_model.dart';
import 'package:hair_salon_nearby/utils/enum/venue_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'venue_list_request_model.g.dart';

@JsonSerializable(createFactory: false)
final class VenueListRequestModel extends ApiRequestModel {
  final int? page;
  final String? search;
  final int? cityCountyId;
  @JsonKey(name: 'longitute')
  final num? longitude;
  @JsonKey(name: 'latitute')
  final num? latitude;
  final VenueType? venueType;

  const VenueListRequestModel({
    this.page,
    this.search,
    this.cityCountyId,
    this.longitude,
    this.latitude,
    this.venueType,
  });

  const VenueListRequestModel.defaults({VenueType venueType = VenueType.man}) : this(page: 1, venueType: venueType);

  @override
  Map<String, dynamic> toJson() => _$VenueListRequestModelToJson(this);
}
