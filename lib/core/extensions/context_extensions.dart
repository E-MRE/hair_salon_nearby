import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension DeviceExtension on BuildContext {
  DeviceScreenType get deviceType => getDeviceType(MediaQuery.of(this).size);

  bool get isDesktop => deviceType == DeviceScreenType.desktop;
  bool get isMobile => deviceType == DeviceScreenType.mobile;
  bool get isTablet => deviceType == DeviceScreenType.tablet;
  bool get isWatch => deviceType == DeviceScreenType.watch;
}

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get appTheme => Theme.of(this);

  bool get isKeyBoardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

//Device operating system checking with context value
extension DeviceOSExtension on BuildContext {
  bool get isAndroidDevice => Platform.isAndroid;
  bool get isIOSDevice => Platform.isIOS;
  bool get isWindowsDevice => Platform.isWindows;
  bool get isLinuxDevice => Platform.isLinux;
  bool get isMacOSDevicec => Platform.isMacOS;
}

//Device Screen Type By Width(300-600-900)
//Values from https://flutter.dev/docs/development/ui/layout/building-adaptive-apps
extension ContextDeviceTypeExtension on BuildContext {
  bool get isSmallScreen => width >= 300 && width < 600 ? true : false;

  bool get isMediumScreen => width >= 600 && width < 900 ? true : false;

  bool get isLargeScreen => width >= 900 ? true : false;
}

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(milliseconds: 500);
  Duration get durationNormal => const Duration(seconds: 1);
  Duration get durationSlow => const Duration(seconds: 2);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  EdgeInsets get horizontalPaddingLow => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalPaddingNormal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalPaddingMedium => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalPaddingHigh => EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get verticalPaddingLow => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalPaddingNormal => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalPaddingMedium => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalPaddingHigh => EdgeInsets.symmetric(vertical: highValue);
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => Radius.circular(width * 0.02);
  Radius get normalRadius => Radius.circular(width * 0.05);
  Radius get highadius => Radius.circular(width * 0.1);
}

extension BorderExtension on BuildContext {
  BorderRadius get normalBorderRadius => BorderRadius.all(Radius.circular(width * 0.05));
  BorderRadius get lowBorderRadius => BorderRadius.all(Radius.circular(width * 0.02));
  BorderRadius get highBorderRadius => BorderRadius.all(Radius.circular(width * 0.1));

  RoundedRectangleBorder get roundedRectangleBorderLow =>
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(lowValue)));

  RoundedRectangleBorder get roundedRectangleAllBorderNormal =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(normalValue));

  RoundedRectangleBorder get roundedRectangleBorderNormal =>
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(normalValue)));

  RoundedRectangleBorder get roundedRectangleBorderMedium =>
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(mediumValue)));

  RoundedRectangleBorder get roundedRectangleBorderHigh =>
      RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(highValue)));
}
