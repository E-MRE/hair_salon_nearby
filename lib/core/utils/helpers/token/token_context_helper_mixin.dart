import '../../../services/models/token_model.dart';
import '../../enums/special_key.dart';
import 'token_context.dart';

mixin TokenContextHelperMixin {
  void saveByTokenModel(TokenContext tokenContext, TokenModel tokenModel) {
    tokenContext.token = tokenModel.token ?? SpecialKey.empty.value;
    tokenContext.refreshToken = tokenModel.refreshToken ?? SpecialKey.empty.value;
    tokenContext.setTokenExpirationDate(tokenModel.expirationDate);
    tokenContext.setRefreshTokenExpirationDate(tokenModel.refreshExpirationDate);
  }

  TokenModel getTokenModelByContext(TokenContext tokenContext) {
    return TokenModel(
      token: tokenContext.token,
      refreshToken: tokenContext.refreshToken,
      expirationDate: tokenContext.tokenExpirationDate.toIso8601String(),
      refreshExpirationDate: tokenContext.refreshTokenExpirationDate.toIso8601String(),
    );
  }

  bool isDateExpired({required String? dateString, int delaySeconds = 10}) {
    assert(delaySeconds >= 0);

    final date = DateTime.tryParse(dateString ?? SpecialKey.empty.value);
    if (date == null) return true;

    final difference = DateTime.now().difference(date).inSeconds;

    return delaySeconds <= difference;
  }
}
