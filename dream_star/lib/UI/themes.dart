import 'package:flutter/material.dart';

// Define your custom fonts
const String fontSFProRounded = "SF Pro Rounded";
const TextStyle headingStyle = TextStyle(
  fontFamily: fontSFProRounded,
  fontWeight: FontWeight.bold,
  fontSize: 34,
);
const TextStyle mainTextStyle = TextStyle(
  fontFamily: fontSFProRounded,
  fontSize: 17,
);
const TextStyle secondaryTextStyle = TextStyle(
  fontFamily: fontSFProRounded,
  fontSize: 12,
);
const TextStyle buttonTextStyle = TextStyle(
  fontFamily: fontSFProRounded,
  fontWeight: FontWeight.bold,
  fontSize: 17,
);
const TextStyle codeTextStyle = TextStyle(
  fontFamily: fontSFProRounded,
  fontWeight: FontWeight.w600,
  fontSize: 34,
);
const TextStyle pageHeadingStyle = TextStyle(
  fontFamily: fontSFProRounded,
  fontWeight: FontWeight.w500,
  fontSize: 17,
);
const TextStyle secondaryTextMediumStyle = TextStyle(
  fontFamily: fontSFProRounded,
  fontWeight: FontWeight.w500,
  fontSize: 12,
);

// Define your custom colors
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color secondary = Color(0xFF8A8A8E);
const Color primary = Color(0xFF6E5AF6);
const Color secondPrimary = Color(0xFFB6E147);
const Color tertiary = Color(0xFFC5C5C7);
const Color textBackground = Color(0x0D3C3C43);
const Color secondaryText = Color(0xCC000000);
const Color blockBackground = Color(0xFF414141);
const Color whiteTransparent = Color(0x99FFFFFF);
const Color primaryMuted = Color(0xFFDEDAFF);
const Color red = Color(0xFFEF4444);
const Color yellow = Color(0xFFF5C20B);
const Color primaryBackground = Color(0xFFF6F5FF);

// Define your custom theme
final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: primaryBackground,
  primaryColor: primary,
  fontFamily: fontSFProRounded,
  textTheme: const TextTheme(
    displayLarge: codeTextStyle,
    displayMedium: headingStyle,
    titleLarge: buttonTextStyle,
    titleMedium: pageHeadingStyle,
    titleSmall: mainTextStyle,
    labelMedium: secondaryTextMediumStyle,
    labelSmall: secondaryTextStyle,
  ),
  colorScheme: const ColorScheme(
    primary: primary,
    primaryContainer: primaryMuted,
    secondary: secondPrimary,
    surface: white,
    background: primaryBackground,
    error: red,
    onPrimary: white,
    onSecondary: black,
    onSurface: black,
    onBackground: black,
    onError: white,
    brightness: Brightness.light,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true
  )
);