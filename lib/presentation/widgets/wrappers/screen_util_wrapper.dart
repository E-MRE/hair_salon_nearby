import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_constants.dart';

class ScreenUtilWrapper extends StatelessWidget {
  const ScreenUtilWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      designSize: AppConstants.designSize,
      builder: (builderContext, builderChild) => child,
      child: child,
    );
  }
}
