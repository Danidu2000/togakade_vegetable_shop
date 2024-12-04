import 'package:intl/intl.dart';

class Formatters {
  static String formatCurrency(double value) {
    final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return formatter.format(value);
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}
