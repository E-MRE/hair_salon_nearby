import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class AesCrypt {
  final AesCbc _algorithm;
  SecretBox? _secretBox;
  SecretKey? _secretKey;

  final String aesKey;
  final String nonceKey;
  final String _emptyText = '';
  final List<int> _emptyChiper = [];

  /// AesCbc 256 bit ile şifreleme yapmak için kullanılmaktadır.
  /// Şifrelemek için mac algoritması `[HMAC SHA256]` tercih edilmiştir.
  ///Şifreleme için isteğe bağlı key girilebilir. Key girilmezse default kullanılır.
  ///Farklı bir algoritma seçilebilir. Seçim yapılmazsa default kullanılır.
  ///Örnek kullanım:
  ///```
  ///var encryptedText = AesCrypt().encrypt('password');
  ///```
  AesCrypt({
    this.aesKey = '89A56E3DF2034387B2C9E72ACE948D36',
    AesCbc? algorithm,
    this.nonceKey = 'c88eb91da7de4277',
  }) : _algorithm =
            algorithm ?? AesCbc.with256bits(macAlgorithm: Hmac.sha256());

  ///Datayı şifrelemek için kullanılır.
  ///Geriye şifrelenmiş veri döndürülür.
  ///İşlem sırasında hata olması durumunda boş string döndürülür.
  ///Örnek kullanım:
  ///```
  ///var encryptedText = AesCrypt().encrypt('password');
  ///```
  Future<String> encrypt(String plainText) async {
    try {
      _secretBox = await _createSecretBox(plainText);
      return base64Encode(_secretBox?.cipherText ?? _emptyChiper);
    } catch (error) {
      return _emptyText;
    }
  }

  Future<String> decrypt(String encryptedText) async {
    try {
      var secretKey = await _createSecretKey();
      var secretBox = await _createSecretBoxForDecrypt(encryptedText);

      var decryptedBytes = await _algorithm.decrypt(
        secretBox,
        secretKey: secretKey,
      );

      return String.fromCharCodes(decryptedBytes);
    } catch (error) {
      return _emptyText;
    }
  }

  Future<SecretBox?> _createSecretBox(String plainText) async {
    try {
      final SecretKey secretKey = await _createSecretKey();
      final nonce = utf8.encode(nonceKey);

      return await _algorithm.encrypt(
        utf8.encode(plainText),
        secretKey: secretKey,
        nonce: nonce,
      );
    } catch (error) {
      return null;
    }
  }

  Future<SecretBox> _createSecretBoxForDecrypt(String encrypted) async {
    var encryptedBytes = base64Decode(encrypted);
    var secretKey = await _createSecretKey();

    var mac = await _algorithm.macAlgorithm.calculateMac(
      encryptedBytes,
      secretKey: secretKey,
    );

    _secretBox = SecretBox(
      encryptedBytes,
      nonce: utf8.encode(nonceKey),
      mac: mac,
    );

    return _secretBox!;
  }

  Future<SecretKey> _createSecretKey() async {
    if (_secretKey != null) {
      return _secretKey!;
    }

    var code = utf8.encode(aesKey);
    _secretKey = await _algorithm.newSecretKeyFromBytes(code);

    return _secretKey!;
  }
}
