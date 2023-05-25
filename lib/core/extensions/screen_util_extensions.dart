import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilNumberExtension on num {
  ///It scales number referenced to the screen & design width
  ///[ScreenUtil.setWidth]
  double get widthScale => this.w;

  ///It scales number referenced to the screen & design height
  ///[ScreenUtil.setHeight]
  double get heightScale => this.h;

  ///It scales number for radius
  ///[ScreenUtil.radius]
  double get radiusScale => this.r;

  ///It scales number for textSize
  ///[ScreenUtil.setSp]
  double get fontSizeScale => this.sp;

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get smartSize => this.sm;

  ///It returns => [Scaled screen width] * [your value]
  double get dynamicWidth => this.sw;

  ///It returns => [Scaled screen width] * [your value]
  double get dynamicHeight => this.sh;
}

extension ScreenUtilEdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using radiusScale [ScreenUtilNumberExtension].
  EdgeInsets get radiusScale => copyWith(
        top: top.radiusScale,
        bottom: bottom.radiusScale,
        right: right.radiusScale,
        left: left.radiusScale,
      );

  /// Creates adapt insets using widthScale [ScreenUtilNumberExtension].
  EdgeInsets get widthScale => copyWith(
        top: top.widthScale,
        bottom: bottom.widthScale,
        right: right.widthScale,
        left: left.widthScale,
      );

  /// Creates adapt insets using heightScale [ScreenUtilNumberExtension].
  EdgeInsets get heightScale => copyWith(
        top: top.heightScale,
        bottom: bottom.heightScale,
        right: right.heightScale,
        left: left.heightScale,
      );

  /// Creates adapt insets using heightScale [ScreenUtilNumberExtension].
  EdgeInsets get symmetricScale => copyWith(
        top: top.heightScale,
        bottom: bottom.heightScale,
        right: right.widthScale,
        left: left.widthScale,
      );
}
