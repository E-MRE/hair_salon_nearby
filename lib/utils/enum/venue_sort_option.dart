import 'package:hair_salon_nearby/utils/constants/lang/locale_keys.g.dart';

enum VenueSortOption {
  gender(LocaleKeys.venueSortOptions_gender),
  price(LocaleKeys.venueSortOptions_price),
  discount(LocaleKeys.venueSortOptions_discount),
  otherPrice(LocaleKeys.venueSortOptions_otherPrice);

  final String localize;
  const VenueSortOption(this.localize);
}
