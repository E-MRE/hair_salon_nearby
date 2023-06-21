import '../../../../utils/enum/hair_salon_type.dart';
import '../../abstract/base_text_theme.dart';
import '../../abstract/base_theme.dart';
import '../../concrete/text/text_theme_light.dart';

class AppThemeLight extends BaseTheme {
  @override
  late final BaseTextTheme textTheme;

  AppThemeLight(super.salonType) {
    colorTheme = salonType.getColorTheme;
    textTheme = TextThemeLight(salonType.color);
  }
}
