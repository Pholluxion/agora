import 'package:flutter/material.dart';

abstract class AppTheme {
  static const double kPadding = 16.0;
  static const double kBorderRadiusAll = 100.0;
  static const double kBorderRadiusSmall = 8.0;
  static const double kBorderRadiusMedium = 16.0;
  static const double kBorderRadiusLarge = 32.0;
  static const double kIconSize = 24.0;

  static Color get emphasisColor => const Color(0xFF54C392);
  static Color get backgroundColor => const Color(0xFFF7F9F2);
  static Color get textColor => const Color(0xFF201E43);
  static Color get errorColor => const Color(0xFFD32F2F);
  static Color get successColor => const Color(0xFF388E3C);
  static Color get warningColor => const Color(0xFFE64A19);
  static Color get infoColor => const Color(0xFF1976D2);
  static Color get whiteColor => const Color(0xFFFFFFFF);
  static Color get blackColor => const Color(0xFF000000);

  static ThemeData get theme => ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: emphasisColor,
        cardTheme: cardTheme,
        iconTheme: iconTheme,
        appBarTheme: appBarTheme,
        dividerTheme: dividerTheme,
        listTileTheme: listTileTheme,
        timePickerTheme: timePickerTheme,
        datePickerTheme: datePickerTheme,
        bottomSheetTheme: bottomSheetTheme,
        scaffoldBackgroundColor: backgroundColor,
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
        segmentedButtonTheme: segmentedButtonTheme,
        inputDecorationTheme: inputDecorationTheme,
      );

  static ListTileThemeData get listTileTheme => ListTileThemeData(
        tileColor: backgroundColor,
        selectedTileColor: emphasisColor,
        iconColor: textColor,
        textColor: textColor,
      );

  static IconThemeData get iconTheme => IconThemeData(
        color: textColor,
        size: kIconSize,
      );

  static ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          foregroundColor: backgroundColor,
          backgroundColor: emphasisColor,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: textColor),
          ),
        ),
      );

  static OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 5,
          shadowColor: textColor,
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: textColor),
          ),
        ),
      );

  static AppBarTheme get appBarTheme => AppBarTheme(
        backgroundColor: emphasisColor,
        centerTitle: true,
        elevation: 5,
        shadowColor: textColor,
        iconTheme: IconThemeData(color: textColor),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: textColor),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(kBorderRadiusMedium),
          ),
        ),
      );

  static BottomSheetThemeData get bottomSheetTheme => BottomSheetThemeData(
        backgroundColor: emphasisColor,
        shadowColor: textColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: textColor),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(kBorderRadiusMedium),
          ),
        ),
      );

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: backgroundColor,
        labelStyle: TextStyle(color: textColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: textColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: textColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          borderSide: BorderSide(color: errorColor),
        ),
      );

  static CardTheme get cardTheme => CardTheme(
        elevation: 0,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
          side: BorderSide(color: textColor),
        ),
      );

  static DividerThemeData get dividerTheme => const DividerThemeData(
        color: Colors.transparent,
      );

  static TimePickerThemeData get timePickerTheme => TimePickerThemeData(
        backgroundColor: backgroundColor,
        hourMinuteColor: backgroundColor,
        dialTextColor: textColor,
        hourMinuteTextColor: textColor,
        dialHandColor: emphasisColor,
        dayPeriodColor: emphasisColor,
        dayPeriodTextColor: textColor,
        dialBackgroundColor: backgroundColor,
        dayPeriodBorderSide: BorderSide(color: textColor),
        dayPeriodShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSmall),
          side: BorderSide(color: textColor),
        ),
        cancelButtonStyle: OutlinedButton.styleFrom(
          elevation: 5,
          shadowColor: textColor,
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: textColor),
          ),
        ),
        confirmButtonStyle: OutlinedButton.styleFrom(
          elevation: 5,
          shadowColor: textColor,
          foregroundColor: textColor,
          backgroundColor: emphasisColor,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: textColor),
          ),
        ),
      );

  static DatePickerThemeData get datePickerTheme => DatePickerThemeData(
        backgroundColor: backgroundColor,
        todayBorder: BorderSide(color: emphasisColor),
        todayBackgroundColor: WidgetStatePropertyAll(backgroundColor),
        todayForegroundColor: WidgetStatePropertyAll(emphasisColor),
        inputDecorationTheme: inputDecorationTheme,
        cancelButtonStyle: OutlinedButton.styleFrom(
          elevation: 5,
          shadowColor: textColor,
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: textColor),
          ),
        ),
        confirmButtonStyle: OutlinedButton.styleFrom(
          elevation: 5,
          shadowColor: textColor,
          foregroundColor: textColor,
          backgroundColor: emphasisColor,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: textColor),
          ),
        ),
      );

  static SegmentedButtonThemeData get segmentedButtonTheme => SegmentedButtonThemeData(
        selectedIcon: const SizedBox(),
        style: SegmentedButton.styleFrom(
          elevation: 5,
          shadowColor: textColor,
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          splashFactory: InkRipple.splashFactory,
          selectedBackgroundColor: emphasisColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusAll),
            side: BorderSide(color: textColor),
          ),
        ),
      );
}
