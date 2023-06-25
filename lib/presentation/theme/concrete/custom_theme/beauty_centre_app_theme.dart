import '../../abstract/base_text_theme.dart';
import '../../abstract/base_theme.dart';
import '../../concrete/text/text_theme_light.dart';

class BeautyCentreAppTheme extends BaseTheme {
  @override
  late final BaseTextTheme textTheme;

  BeautyCentreAppTheme() : super.beauty() {
    textTheme = TextThemeLight(salonType.color);
  }
}
