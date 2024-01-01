import 'dart:ui';

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

/// Extension to convert a [Color] to a hex string
extension ColorsExtensions on Color {
  String toHex() {
    return '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}

/// Extension to convert a [String] to a Color
extension StringExtensions on String {
  Color toColor() {
    try {
      var hexColor = toUpperCase().replaceAll('#', '');
      if (hexColor.length == 6) hexColor = 'FF$hexColor';
      final data = int.parse(hexColor, radix: 16);
      return Color(data);
    } catch (e) {
      /// Return transparent color if the color is not valid
      return const Color(0x00000000);
    }
  }
}

extension WhereNotNullIterableExtension<T extends Object> on Iterable<T?> {
  Iterable<T> whereNotNull() => whereType<T>();
}
