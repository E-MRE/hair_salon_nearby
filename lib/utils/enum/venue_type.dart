import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'venueType')
enum VenueType {
  man(0),
  woman(1),
  mixed(2);

  final int venueType;
  const VenueType(this.venueType);
}
