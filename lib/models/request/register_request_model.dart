import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/api_request_model.dart';
import '../../utils/enum/gender.dart';
import '../../utils/enum/platform_type.dart';

part 'register_request_model.g.dart';

@JsonSerializable(createFactory: false)
class RegisterRequestModel extends ApiRequestModel {
  final String name;
  final String surname;
  final String password;
  final String email;
  final String phone;
  final int gender;
  final int cityCountyId;
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
    this.phone = '',
    required Gender gender,
    required this.cityCountyId,
    this.latitude = '',
    this.longitude = '',
    required PlatformType platform,
    required this.version,
    this.notificationId = '',
  })  : gender = gender.value,
        platform = platform.value;

  @override
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
