import '../../../../utils/gen/colors.gen.dart';
import '../../abstract/base_color_theme.dart';
import '../../abstract/base_text_theme.dart';
import '../../abstract/base_theme.dart';
import '../../concrete/color/color_theme_light.dart';
import '../../concrete/text/text_theme_light.dart';

class AppThemeLight extends BaseTheme {
  @override
  BaseColorTheme get colorTheme => ColorThemeLight();

  @override
  late final BaseTextTheme textTheme;

  AppThemeLight() {
    textTheme = TextThemeLight(AppColors.primary);
  }
}
