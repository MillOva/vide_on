import 'package:flutter/cupertino.dart';
import 'package:vide_on/global/app_style/colors.dart';


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
TextStyle title_1Font(){
    return TextStyle(
      letterSpacing: 1,
      color: calcite(),
      fontSize: 24,
      fontFamily: 'CircularStdBold',
    );
}
TextStyle title_2Font(){
  return TextStyle(
    letterSpacing: 1,
    color: graphite(),
    fontSize: 24,
    fontFamily: 'CircularStdBold',
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

TextStyle bodyFont2() {
  return
    TextStyle(
      letterSpacing: 0.67,
      color: graphite(),
      fontSize: 16,
      fontFamily: 'CircularStdBook',
    );
}

TextStyle bodyFont3() {
  return
    TextStyle(
      letterSpacing: 0.67,
      color: Color.fromARGB(255, 224, 32, 32),
      fontSize: 16,
      fontFamily: 'CircularStdBook',
    );
}

TextStyle sfProActive() {
  return
    TextStyle(
      letterSpacing: -0.24,
      color: Color.fromARGB(255, 10, 122, 255),
      fontSize: 10,
      //fontFamily: 'Noteworthy-Lt',//SFPRo
    );
}
TextStyle sfProNonActive() {
  return
    TextStyle(
      letterSpacing: -0.24,
      color: graphite(),
      fontSize: 10,
      //fontFamily: 'Noteworthy-Lt',//SFPRo
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