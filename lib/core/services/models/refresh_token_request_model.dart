import 'package:json_annotation/json_annotation.dart';

import '../../utils/helpers/token/token_context.dart';
import 'api_request_model.dart';

part 'refresh_token_request_model.g.dart';

@JsonSerializable(createFactory: false)
class RefreshTokenRequestModel implements ApiRequestModel {
  final String token;
  final String refreshToken;

  RefreshTokenRequestModel({required this.token, required this.refreshToken});

  RefreshTokenRequestModel.byTokenContext({required TokenContext tokenContext})
      : token = tokenContext.token,
        refreshToken = tokenContext.refreshToken;

  Map<String, dynamic> toJson() => _$RefreshTokenRequestModelToJson(this);
}
