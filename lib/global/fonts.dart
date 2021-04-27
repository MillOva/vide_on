import 'package:flutter/cupertino.dart';
import 'package:vide_on/global/colors.dart';

  TextStyle logoFont() {
    return
      TextStyle(
        letterSpacing: 2.4,
        color: Color.fromARGB(255, 0, 145, 255),
        fontSize: 44,
        fontFamily: 'Noteworthy-Lt',
      );
  }

TextStyle titleFont() {
  return
    TextStyle(
      letterSpacing: 2.4,
      color: Color.fromARGB(255, 0, 145, 255),
      fontSize: 44,
      fontFamily: 'Noteworthy-Lt',
    );
}
TextStyle headlineFont() {
  return
    TextStyle(
      letterSpacing: 0.79,
      color: calcite(),
      fontSize: 19,
      fontFamily: 'CircularStdBold',
    );
}
TextStyle buttonFont() {
  return
    TextStyle(
      letterSpacing: 0.71,
      color: calcite(),
      fontSize: 17,
      fontFamily: 'CircularStdBook',
    );
}

TextStyle bodyFont() {
  return
    TextStyle(
      letterSpacing: 0.67,
      color: calcite(),
      fontSize: 16,
      fontFamily: 'CircularStdBook',
    );
}

TextStyle hyperLinkBlue() {
  return
      TextStyle(
        letterSpacing: 0.71,
        color: sapphire(),
        fontSize: 17,
        fontFamily: 'CircularStdBook', decoration: TextDecoration.underline
      );
}
TextStyle hyperLinkWhite() {
  return
    TextStyle(
        letterSpacing: 0.71,
        color: calcite(),
        fontSize: 17,
        fontFamily: 'CircularStdBook', decoration: TextDecoration.underline
    );
}