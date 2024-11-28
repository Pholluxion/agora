import 'package:flutter/material.dart';

abstract class AppTheme {
  static const double kPadding = 16.0;
  static const double kBorderRadiusAll = 100.0;
  static const double kBorderRadiusSmall = 8.0;
  static const double kBorderRadiusMedium = 16.0;
  static const double kBorderRadiusLarge = 32.0;
  static const double kIconSize = 24.0;

  static Color get accent => const Color(0xFF6B99C3);
  static Color get background => const Color(0xFFE6E6E6);
  static Color get highlight => const Color(0xFFE4E5EA);
  static Color get text => const Color(0xFF0C151C);
  static Color get error => const Color(0xFFD32F2F);
  static Color get success => const Color(0xFF388E3C);
  static Color get warning => const Color(0xFFE64A19);
  static Color get info => const Color(0xFF1976D2);
  static Color get white => const Color(0xFFFFFFFF);
  static Color get black => const Color(0xFF000000);

  static ThemeData get theme => ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: accent,
        cardTheme: cardTheme,
        appBarTheme: appBarTheme,
        bottomSheetTheme: bottomSheetTheme,
        scaffoldBackgroundColor: background,
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
        inputDecorationTheme: inputDecorationTheme,
      );

  static ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: highlight,
          backgroundColor: accent,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: text),
          ),
        ),
      );

  static OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: text,
          backgroundColor: background,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: text),
          ),
        ),
      );

  static AppBarTheme get appBarTheme => AppBarTheme(
        backgroundColor: accent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: text),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: text),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(kBorderRadiusMedium),
          ),
        ),
      );

  static BottomSheetThemeData get bottomSheetTheme => BottomSheetThemeData(
        backgroundColor: accent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: text),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(kBorderRadiusMedium),
          ),
        ),
      );

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: background,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: text),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: text),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: error),
        ),
      );

  static CardTheme get cardTheme => CardTheme(
        elevation: 0,
        color: highlight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
          side: BorderSide(color: text),
        ),
      );
}
