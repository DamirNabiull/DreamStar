import 'package:flutter/material.dart';

// Define your custom fonts
const String fontSFProRounded = "SF Pro Rounded";
const TextStyle displayLargeStyle = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w600,
  fontSize: 34.0,
  letterSpacing: 0.0,
  color: white,
);
const TextStyle displayLargeStylePrimary = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w600,
  fontSize: 34.0,
  letterSpacing: 0.0,
  color: primary,
);
const TextStyle displayMediumStyle = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w700,
  fontSize: 34.0,
  letterSpacing: 0.0,
  color: primary,
);
const TextStyle displayMediumStyleWhite = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w700,
  fontSize: 34.0,
  letterSpacing: 0.0,
  color: white,
);
const TextStyle titleLargeStyle = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w700,
  fontSize: 17.0,
  letterSpacing: 0.0,
  color: white,
);
const TextStyle titleLargeStyleSecondary = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w700,
  fontSize: 17.0,
  letterSpacing: 0.0,
  color: secondary,
);
const TextStyle titleMediumStyle = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w500,
  fontSize: 17.0,
  letterSpacing: 0.0,
  color: primary,
);
const TextStyle titleMediumStyleWhite = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w500,
  fontSize: 17.0,
  letterSpacing: 0.0,
  color: white,
);
const TextStyle titleSmallStyle = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w400,
  fontSize: 17.0,
  letterSpacing: 0.0,
  color: black,
);
const TextStyle titleSmallStyleSecondary = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w400,
  fontSize: 17.0,
  letterSpacing: 0.0,
  color: secondary,
);
const TextStyle titleSmallStyleTertiary = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w400,
  fontSize: 17.0,
  letterSpacing: 0.0,
  color: tertiary,
);
const TextStyle labelMediumStyle = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
  letterSpacing: 0.0,
  color: black,
);
const TextStyle labelMediumStylePrimary = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
  letterSpacing: 0.0,
  color: primary,
);
const TextStyle labelMediumStyleSecondary = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
  letterSpacing: 0.0,
  color: secondary,
);
const TextStyle labelMediumStyleRed = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
  letterSpacing: 0.0,
  color: red,
);
const TextStyle labelSmallStyle = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
  letterSpacing: 0.0,
  color: secondary,
);
const TextStyle labelSmallStyleSecondPrimary = TextStyle(
  fontFamily: 'fontSFProRounded',
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
  letterSpacing: 0.0,
  color: secondPrimary,
);

// Define your custom colors
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color whiteTransparent = Color(0x99FFFFFF);
const Color primary = Color(0xFF6E5AF6);
const Color primaryMuted = Color(0xFFDEDAFF);
const Color primaryBackground = Color(0xFFF6F5FF);
const Color secondPrimary = Color(0xFFB6E147);
const Color secondary = Color(0xFF8A8A8E);
const Color tertiary = Color(0xFFC5C5C7);
const Color blockBackground = Color(0xFF414141);
const Color red = Color(0xFFEF4444);
const Color yellow = Color(0xFFF5C20B);
const Color secondaryText = Color(0xCC000000);
const Color textBackground = Color(0x0D3C3C43);

// Define your custom theme
final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: primaryBackground,
  primaryColor: primary,
  fontFamily: fontSFProRounded,
  textTheme: const TextTheme(
    displayLarge: displayLargeStyle,
    displayMedium: displayMediumStyle,
    titleLarge: titleLargeStyle,
    titleMedium: titleMediumStyle,
    titleSmall: titleSmallStyle,
    labelMedium: labelMediumStyle,
    labelSmall: labelSmallStyle,
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