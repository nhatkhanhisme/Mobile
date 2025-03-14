import 'package:flutter/cupertino.dart';

class CustomTheme {
  const CustomTheme();

  static const Color primaryColor = Color(0xFFc13e80);
  static const Color secondaryColor = Color(0xFF3ec17f);
  static const Color loginGradientStart = Color.fromARGB(255, 255, 238, 247);
  static const Color loginGradientEnd = Color.fromARGB(255, 248, 160, 204);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
