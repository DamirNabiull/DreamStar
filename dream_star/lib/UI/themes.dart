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
  color: white,
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
const Color secondPrimaryMuted = Color(0xFFDAECAD);
const Color secondary = Color(0xFF8A8A8E);
const Color tertiary = Color(0xFFC5C5C7);
const Color blockBackground = Color(0xFF414141);
const Color red = Color(0xFFEF4444);
const Color yellow = Color(0xFFF5C20B);
const Color secondaryText = Color(0xCC000000);
const Color textBackground = Color(0x0D3C3C43);
List<Color> cardLineColors = [
  const Color(0xffef4444),
  const Color(0xfff97316),
  const Color(0xfff59e0b),
  const Color(0xffeab308),
  const Color(0xff84cc16),
  const Color(0xff22c55e),
  const Color(0xff10b981),
  const Color(0xff14b8a6),
  const Color(0xff06b6d4),
  const Color(0xff0ea5e9),
  const Color(0xff3b82f6),
  const Color(0xff6366f1),
  const Color(0xff8b5cf6),
  const Color(0xffa855f7),
  const Color(0xffd946ef),
  const Color(0xffec4899),
  const Color(0xfff43f5e),
];

TextStyle sendTaskButtonText = labelMediumStyle;
BoxDecoration sendTaskButton = BoxDecoration(
  color: secondPrimary,
  borderRadius: BorderRadius.circular(12.0),
);

TextStyle onReviewTaskButtonText = labelMediumStyle.copyWith(color: secondary);
BoxDecoration onReviewTaskButton = BoxDecoration(
  color: primaryMuted,
  borderRadius: BorderRadius.circular(12.0),
);

TextStyle acceptTaskButtonText = labelMediumStyle.copyWith(color: white);
BoxDecoration acceptTaskButton = BoxDecoration(
  color: primary,
  borderRadius: BorderRadius.circular(12.0),
);

TextStyle inactiveDreamButtonText = labelMediumStyle.copyWith(color: secondary);
BoxDecoration onReviewDreamButton = BoxDecoration(
  color: secondPrimaryMuted,
  borderRadius: BorderRadius.circular(12.0),
);

BoxDecoration onAwaitDreamButton = BoxDecoration(
  color: primaryMuted,
  borderRadius: BorderRadius.circular(12.0),
);

TextStyle acceptDreamButtonText = labelMediumStyle.copyWith(color: white);
BoxDecoration acceptDreamButton = BoxDecoration(
  color: primary,
  borderRadius: BorderRadius.circular(12.0),
);

TextStyle completeDreamButtonText = labelMediumStyle.copyWith(color: white);
BoxDecoration completeDreamButton = BoxDecoration(
  color: primary,
  borderRadius: BorderRadius.circular(12.0),
);

TextStyle approvedDreamButtonText = labelMediumStyle.copyWith(color: black);
BoxDecoration approvedDreamButton = BoxDecoration(
  color: secondPrimary,
  borderRadius: BorderRadius.circular(12.0),
);

TextStyle approvedMutedDreamButtonText = labelMediumStyle.copyWith(color: secondary);
BoxDecoration approvedMutedDreamButton = BoxDecoration(
  color: secondPrimaryMuted,
  borderRadius: BorderRadius.circular(12.0),
);

ButtonStyle buttonWithoutBackingText =
    TextButton.styleFrom(textStyle: titleSmallStyle.copyWith(color: primary));

@immutable
class ThemeExtensions extends ThemeExtension<ThemeExtensions> {
  ThemeExtensions();

  final TextStyle acceptTaskButtonTextStyle = acceptTaskButtonText;
  final BoxDecoration acceptTaskButtonStyle = acceptTaskButton;
  final TextStyle sendTaskButtonTextStyle = sendTaskButtonText;
  final BoxDecoration sendTaskButtonStyle = sendTaskButton;
  final TextStyle onReviewTaskButtonTextStyle = onReviewTaskButtonText;
  final BoxDecoration onReviewTaskButtonStyle = onReviewTaskButton;
  final TextStyle inactiveDreamButtonTextStyle = inactiveDreamButtonText;
  final BoxDecoration onReviewDreamButtonStyle = onReviewDreamButton;
  final BoxDecoration onAwaitDreamButtonStyle = onAwaitDreamButton;
  final TextStyle acceptDreamButtonTextStyle = acceptDreamButtonText;
  final BoxDecoration acceptDreamButtonStyle = acceptDreamButton;
  final TextStyle completeDreamButtonTextStyle = completeDreamButtonText;
  final BoxDecoration completeDreamButtonStyle = completeDreamButton;
  final TextStyle approvedDreamButtonTextStyle = approvedDreamButtonText;
  final BoxDecoration approvedDreamButtonStyle = approvedDreamButton;
  final TextStyle approvedMutedDreamButtonTextStyle = approvedMutedDreamButtonText;
  final BoxDecoration approvedMutedDreamButtonStyle = approvedMutedDreamButton;

  @override
  ThemeExtensions copyWith() {
    return ThemeExtensions();
  }

  @override
  ThemeExtensions lerp(ThemeExtensions? other, double t) {
    if (other is! ThemeExtensions) {
      return this;
    }
    return ThemeExtensions();
  }
}

// Define your custom theme
final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: white,
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
    primaryContainer: white,
    secondary: secondPrimary,
    surface: white,
    background: primaryBackground,
    error: red,
    onPrimary: white,
    onSecondary: white,
    onSurface: white,
    onBackground: primaryMuted,
    onError: white,
    brightness: Brightness.light,
  ),
  inputDecorationTheme: const InputDecorationTheme(
      isDense: true
  ),
  extensions: [ThemeExtensions()],
);
