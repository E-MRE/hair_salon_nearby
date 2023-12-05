import 'package:hair_salon_nearby/utils/enum/platform_type.dart';

class DeviceInfo {
  String _appVersion;
  String _serialNo;
  PlatformType _platformType;

  DeviceInfo({String appVersion = '', String serialNo = '', PlatformType platformType = PlatformType.android})
      : _appVersion = appVersion,
        _serialNo = serialNo,
        _platformType = platformType;

  DeviceInfo.test() : this(appVersion: '1.0.0', serialNo: '123456', platformType: PlatformType.android);

  String get appVersion => _appVersion;
  String get serialNo => _serialNo;
  PlatformType get platformType => _platformType;

  void setVersion(String version) {
    if (version.isEmpty) return;
    _appVersion = version;
  }

  void setSerialNo(String serialNo) {
    if (_serialNo.isEmpty) return;
    _serialNo = serialNo;
  }

  void setPlatform(PlatformType platformType) {
    _platformType = platformType;
  }

  void setAll({required String version, required String serialNo, required PlatformType platformType}) {
    setVersion(version);
    setSerialNo(serialNo);
    setPlatform(platformType);
  }
}
