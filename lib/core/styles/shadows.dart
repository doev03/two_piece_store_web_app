import 'package:flutter/painting.dart';

class AppShadows {
  static const primary = [
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 1,
    ),
    BoxShadow(
      color: Color(0x0d000000),
      offset: Offset(0, 1),
      blurRadius: 1,
    ),
    BoxShadow(
      color: Color(0x0a000000),
      offset: Offset(0, 2),
      blurRadius: 10,
    ),
  ];
}
