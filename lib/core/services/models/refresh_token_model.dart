class RefreshTokenModel {
  String? refreshToken;

  RefreshTokenModel(this.refreshToken);

  Map<String, dynamic> toJson() {
    return {'grant_type': 'refresh_token', 'refresh_token': refreshToken};
  }
}
