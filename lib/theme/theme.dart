import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color appColor = Color(0xffE60000);
  static const Color darkBackground = Color(0xFF16202A);
  static const Color darkCard = Color(0xFF2B353F);
  static const Color gradiantColor = Colors.greenAccent;
  static const Color dashItem = Color(0xffe3ecfe);
  static const Color choiceOrange = Color(0XffFE8D3F);
  static const Color unselectedColor = Color(0xffe3ecfe)/*(0xffF8F7FF)*/;
  static const String fontName = 'Roboto';
  static const double settingTitle = 20;
  static const double settingItem = 16;

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    //letterSpacing: 0.27,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );
  static const TextStyle body1_white = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: white,
  );
  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: white,
  );
  static const TextStyle homeTitle = TextStyle(
    fontFamily: AppTheme.fontName,
    fontSize: 22,
    color: AppTheme.appColor,
    fontWeight: FontWeight.w700,
  );
}
