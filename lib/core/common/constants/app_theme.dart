import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mboilerplateflutter/core/common/constants/app_color.dart';
import 'package:mboilerplateflutter/core/common/constants/app_string.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: AppString.fontFamily,
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.white,
      primaryColor: AppColor.primary,
      dialogBackgroundColor: AppColor.white,
      canvasColor: AppColor.white,
      drawerTheme: const DrawerThemeData(
        surfaceTintColor: AppColor.white,
        backgroundColor: AppColor.white,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColor.white,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: AppColor.white,
      ),
      primarySwatch: const MaterialColor(
        0xFF00A69C,
        {
          50: AppColor.primary,
          100: AppColor.primary,
          200: AppColor.primary,
          300: AppColor.primary,
          400: AppColor.primary,
          500: AppColor.primary,
          600: AppColor.primary,
          700: AppColor.primary,
          800: AppColor.primary,
          900: AppColor.primary,
        },
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 18),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        iconSize: 20,
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 1,
        shadowColor: AppColor.shadow,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        foregroundColor: AppColor.white,
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        titleTextStyle: TextStyle(
          color: AppColor.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        toolbarTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        actionsIconTheme: IconThemeData(size: 20),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 57),
        displayMedium: TextStyle(fontSize: 45),
        displaySmall: TextStyle(fontSize: 36),
        headlineLarge: TextStyle(fontSize: 32),
        headlineMedium: TextStyle(fontSize: 28),
        headlineSmall: TextStyle(fontSize: 24),
        titleLarge: TextStyle(fontSize: 22),
        titleMedium: TextStyle(fontSize: 16),
        titleSmall: TextStyle(fontSize: 14),
        labelLarge: TextStyle(fontSize: 14),
        labelMedium: TextStyle(fontSize: 12),
        labelSmall: TextStyle(fontSize: 11),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
        bodySmall: TextStyle(fontSize: 12),
      ),
      colorScheme: const ColorScheme.light()
          .copyWith(
            primary: AppColor.primary,
            onPrimary: AppColor.primary,
          )
          .copyWith(
            primary: AppColor.primary,
            secondary: AppColor.primary,
            brightness: Brightness.light,
          ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: AppString.fontFamily,
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.bgBlack,
      primaryColor: AppColor.primary,
      dialogBackgroundColor: AppColor.white,
      canvasColor: AppColor.white,
      drawerTheme: const DrawerThemeData(
        surfaceTintColor: AppColor.white,
        backgroundColor: AppColor.white,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColor.white,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: AppColor.black,
      ),
      primarySwatch: const MaterialColor(0xFF000000, {
        50: Colors.black,
        100: Colors.black,
        200: Colors.black,
        300: Colors.black,
        400: Colors.black,
        500: Colors.black,
        600: Colors.black,
        700: Colors.black,
        800: Colors.black,
        900: Colors.black,
      }),
      iconTheme: const IconThemeData(color: AppColor.white, size: 18),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        iconSize: 20,
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        shadowColor: AppColor.shadow,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        foregroundColor: AppColor.white,
        backgroundColor: AppColor.appBarBlack,
        surfaceTintColor: AppColor.white,
        titleTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        toolbarTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: AppColor.white,
          size: 20,
        ),
        actionsIconTheme: IconThemeData(size: 20),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 57), //Default: regular
        displayMedium: TextStyle(fontSize: 45), //Default: regular
        displaySmall: TextStyle(fontSize: 36), //Default: regular
        headlineLarge: TextStyle(fontSize: 32), //Default: regular
        headlineMedium: TextStyle(fontSize: 28), //Default: regular
        headlineSmall: TextStyle(fontSize: 24), //Default: regular
        titleLarge: TextStyle(fontSize: 22), // Default: regular
        titleMedium: TextStyle(fontSize: 16), // Default: medium
        titleSmall: TextStyle(fontSize: 14), // Default: medium
        labelLarge: TextStyle(fontSize: 14), // Default: medium
        labelMedium: TextStyle(fontSize: 12), // Default: medium
        labelSmall: TextStyle(fontSize: 11), // Default: medium
        bodyLarge: TextStyle(fontSize: 16), // Default: regular
        bodyMedium: TextStyle(fontSize: 14), // Default: regular
        bodySmall: TextStyle(fontSize: 12), // Default: regular
      ),
      colorScheme: const ColorScheme.light()
          .copyWith(
            primary: AppColor.primary,
            onPrimary: AppColor.primary,
          )
          .copyWith(
            primary: AppColor.primary,
            secondary: AppColor.primary,
            brightness: Brightness.dark,
          ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColor.primary,
      ),
    );
  }
}
