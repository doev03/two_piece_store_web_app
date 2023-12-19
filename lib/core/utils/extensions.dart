import 'package:intl/intl.dart';

import '../../debug/utils/debug_stubs.dart';

extension NumExtensions on num {
  String format([String locale = localeDebugStub]) {
    final numberFormat = NumberFormat(null, locale)
      ..minimumExponentDigits = 0
      ..maximumFractionDigits = 2;
    return numberFormat.format(this);
  }

  String formatMoney({
    String symbol = currencySymbolDebugStub,
    String locale = localeDebugStub,
  }) {
    final numberFormat = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 0,
      locale: locale,
    )..maximumFractionDigits = 2;
    return numberFormat.format(this);
  }
}
