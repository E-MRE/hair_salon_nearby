import '../../../utils/enum/hair_salon_type.dart';
import 'base_color_theme.dart';
import 'base_text_theme.dart';

abstract class BaseTheme {
  BaseTextTheme get textTheme;
  BaseColorTheme colorTheme;

  BaseTheme(this.salonType) : colorTheme = salonType.getColorTheme;

  HairSalonType salonType;

  void setSalonType(HairSalonType salonType) {
    this.salonType = salonType;
    colorTheme = salonType.getColorTheme;
  }
}
