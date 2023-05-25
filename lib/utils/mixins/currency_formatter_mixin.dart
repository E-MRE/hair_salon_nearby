import 'package:intl/intl.dart';

mixin CurrencyFormatterMixin {
  String getMoneyFormat({required num money, String format = '#,##0.00'}) {
    var numberFormat = NumberFormat(format);
    return numberFormat.format(money);
  }
}
