import 'package:json_annotation/json_annotation.dart';

import '../../core/services/models/api_request_model.dart';
import '../../utils/enum/platform_type.dart';

part 'check_update_request_model.g.dart';

@JsonSerializable(createFactory: false)
class CheckUpdateRequestModel extends ApiRequestModel {
  final int platform;
  final String version;

  CheckUpdateRequestModel({required PlatformType platform, required this.version}) : platform = platform.value;

  @override
  Map<String, dynamic> toJson() => _$CheckUpdateRequestModelToJson(this);
}
