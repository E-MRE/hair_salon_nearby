import 'package:json_annotation/json_annotation.dart';

import '../../utils/enums/environment/dot_environment_type.dart';
import 'api_request_model.dart';
import 'entity_model.dart';

part 'token_request_model.g.dart';

@JsonSerializable()
class TokenRequestModel extends ApiRequestModel implements EntityModel<TokenRequestModel> {
  final String clientId;
  final String clientSecret;

  TokenRequestModel({required this.clientId, required this.clientSecret});

  factory TokenRequestModel.fromJson(Map<String, dynamic> json) => _$TokenRequestModelFromJson(json);

  factory TokenRequestModel.clientInfo() {
    return TokenRequestModel(
      clientId: DotEnvironmentType.clientId.read(),
      clientSecret: DotEnvironmentType.clientSecret.read(),
    );
  }

  Map<String, dynamic> toJson() => _$TokenRequestModelToJson(this);

  @override
  TokenRequestModel fromJson(Map<String, dynamic> json) => _$TokenRequestModelFromJson(json);
}
