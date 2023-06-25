import '../../abstract/base_text_theme.dart';
import '../../abstract/base_theme.dart';
import '../../concrete/text/text_theme_light.dart';

class WomenAppTheme extends BaseTheme {
  @override
  late final BaseTextTheme textTheme;

  WomenAppTheme() : super.women() {
    textTheme = TextThemeLight(salonType.color);
  }
}
