import '../../abstract/base_text_theme.dart';
import '../../abstract/base_theme.dart';
import '../../concrete/text/text_theme_light.dart';

class MenAppTheme extends BaseTheme {
  @override
  late final BaseTextTheme textTheme;

  MenAppTheme() : super.men() {
    textTheme = TextThemeLight(salonType.color);
  }
}
