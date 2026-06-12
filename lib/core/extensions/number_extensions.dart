import 'package:intl/intl.dart';

extension NumberExtensions on num {
  String toCurrency({
    String symbol = '\$',
    int decimalPlaces = 2,
  }) {
    final formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalPlaces,
    );
    return formatter.format(this);
  }

  String toFormattedString({int decimalPlaces = 2}) {
    if (this == null) return '0';
    return toStringAsFixed(decimalPlaces);
  }

  String toCompactString() {
    if (abs() >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (abs() >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    }
    return toStringAsFixed(2);
  }

  bool isPositive() => this > 0;
  bool isNegative() => this < 0;
  bool isZero() => this == 0;
}
