const String _secretKey = '**=?=**';
const String _kEmpty = '';

abstract class TokenContext {
  String _token;
  String _refreshToken;
  DateTime _tokenExpirationDate;
  DateTime _refreshTokenExpirationDate;

  String get token => _simplificationText(_token);
  String get refreshToken => _simplificationText(_refreshToken);
  DateTime get tokenExpirationDate => _tokenExpirationDate;
  DateTime get refreshTokenExpirationDate => _refreshTokenExpirationDate;

  final String tokenDateFormat;

  TokenContext({this.tokenDateFormat = '0001-01-01T01:01:01.0000000+00:00'})
      : _token = _kEmpty,
        _refreshToken = _kEmpty,
        _tokenExpirationDate = DateTime(1),
        _refreshTokenExpirationDate = DateTime(1);

  DateTime convertStringToDateTime(String? dateString);

  set token(String token) {
    _token = _complicateText(token);
  }

  set refreshToken(String refreshToken) {
    _refreshToken = _complicateText(refreshToken);
  }

  void setTokenExpirationDate(String? dateString) {
    _tokenExpirationDate = convertStringToDateTime(dateString);
  }

  void setRefreshTokenExpirationDate(String? dateString) {
    _refreshTokenExpirationDate = convertStringToDateTime(dateString);
  }

  String _complicateText(String text) {
    var obscuredText = _secretKey;
    obscuredText += text.split(_kEmpty).reversed.join();
    obscuredText += _secretKey;
    return obscuredText;
  }

  String _simplificationText(String text) {
    var simpleText = text.replaceAll(_secretKey, _kEmpty);
    return simpleText.split(_kEmpty).reversed.join();
  }
}
