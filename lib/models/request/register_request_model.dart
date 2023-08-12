import '../../core/services/models/api_request_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequestModel extends ApiRequestModel {
  final String name;
  final String surname;
  final String password;
  final String email;
  final String phone;
  final int gender;
  final String city;
  final String county;
  final String latitude;
  final String longitude;
  final int platform;
  final String version;
  final String notificationId;

  RegisterRequestModel({
    required this.name,
    required this.surname,
    required this.password,
    required this.email,
    required this.phone,
    required this.gender,
    required this.city,
    required this.county,
    required this.latitude,
    required this.longitude,
    required this.platform,
    required this.version,
    required this.notificationId,
  });

  @override
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
