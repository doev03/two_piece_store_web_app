import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const primaryRadius = 10.0;
const primaryBorderRadius = BorderRadius.all(Radius.circular(primaryRadius));

/*const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff5288c1),
  onPrimary: onPrimary,
  secondary: secondary,
  onSecondary: onSecondary,
  error: error,
  onError: onError,
  background: background,
  onBackground: onBackground,
  surface: surface,
  onSurface: onSurface,
);*/

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff5288c1),
  onPrimary: Colors.white,
  secondary: Color(0xff232E3C),
  onSecondary: Colors.white,
  error: Color.fromRGBO(230, 77, 69, 1),
  onError: Colors.white,
  background: Color(0xff232E3C),
  onBackground: Colors.white,
  surface: Color(0xff232E3C),
  onSurface: Colors.white,
);
