import 'package:intl/intl.dart';

class AppFormatters {
  static final NumberFormat inrCurrency = NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  static String formatInr(num value) => inrCurrency.format(value);
}
