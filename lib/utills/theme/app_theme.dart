import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sust_app/utills/theme/apps_colors.dart';
import 'package:sust_app/utills/theme/text.style.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData getLightModeTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColorLight,
      scaffoldBackgroundColor: AppColors.lightThemeColors['backgroundColor'],
      primaryColorDark: AppColors.primaryColorDark,
      cardColor: Colors.white,
      canvasColor: AppColors.lightThemeColors['backgroundColor'],
      shadowColor: AppColors.whiteColorLight,
      disabledColor: AppColors.grey,
      hintColor: AppColors.lightGrey,
      brightness: Brightness.light,
      dialogBackgroundColor: AppColors.lightThemeColors['backgroundColor'],
      dividerColor: AppColors.lightThemeColors['backgroundColor'],
      cupertinoOverrideTheme: const CupertinoThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: const UnderlineInputBorder(),
        errorStyle: subtitle2.copyWith(color: Colors.red),
      ),
      textTheme: TextTheme(
        displayLarge:
            headline1.copyWith(color: AppColors.lightThemeColors['textColor']),
        displayMedium:
            headline2.copyWith(color: AppColors.lightThemeColors['textColor']),
        displaySmall:
            headline3.copyWith(color: AppColors.lightThemeColors['textColor']),
        headlineMedium:
            headline4.copyWith(color: AppColors.lightThemeColors['textColor']),
        headlineSmall:
            headline5.copyWith(color: AppColors.lightThemeColors['textColor']),
        titleLarge:
            headline6.copyWith(color: AppColors.lightThemeColors['textColor']),
        labelLarge:
            button.copyWith(color: AppColors.lightThemeColors['textColor']),
        bodySmall:
            caption.copyWith(color: AppColors.lightThemeColors['textColor']),
        bodyLarge:
            bodyText1.copyWith(color: AppColors.lightThemeColors['textColor']),
        bodyMedium:
            bodyText2.copyWith(color: AppColors.lightThemeColors['textColor']),
        titleMedium:
            input.copyWith(color: AppColors.lightThemeColors['textColor']),
        titleSmall:
            subtitle2.copyWith(color: AppColors.lightThemeColors['textColor']),
      ),
      colorScheme: ColorScheme.light(
          background: AppColors.lightThemeColors['backgroundColor']!),
      bottomAppBarTheme: BottomAppBarTheme(
          color: AppColors.lightThemeColors['backgroundColor']),
    );
  }

  static ThemeData getDarkModeTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColorDark,
      primaryTextTheme: const TextTheme(),
      scaffoldBackgroundColor: AppColors.black,
      primaryColorDark: AppColors.primaryColorDark,
      cardColor: AppColors.grey,
      canvasColor: AppColors.black,
      disabledColor: AppColors.grey,
      hintColor: AppColors.lightGrey,
      brightness: Brightness.dark,
      dialogBackgroundColor: AppColors.grey,
      dividerColor: AppColors.black,
      cupertinoOverrideTheme: const CupertinoThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: const UnderlineInputBorder(),
        errorStyle: subtitle2.copyWith(color: Colors.red),
      ),
      textTheme: TextTheme(
        displayLarge:
            headline1.copyWith(color: AppColors.darkThemeColors['textColor']),
        displayMedium:
            headline2.copyWith(color: AppColors.darkThemeColors['textColor']),
        displaySmall:
            headline3.copyWith(color: AppColors.darkThemeColors['textColor']),
        headlineMedium:
            headline4.copyWith(color: AppColors.darkThemeColors['textColor']),
        headlineSmall:
            headline5.copyWith(color: AppColors.darkThemeColors['textColor']),
        titleLarge:
            headline6.copyWith(color: AppColors.darkThemeColors['textColor']),
        labelLarge:
            button.copyWith(color: AppColors.darkThemeColors['textColor']),
        bodySmall:
            caption.copyWith(color: AppColors.darkThemeColors['textColor']),
        bodyLarge:
            bodyText1.copyWith(color: AppColors.darkThemeColors['textColor']),
        bodyMedium:
            bodyText2.copyWith(color: AppColors.darkThemeColors['textColor']),
        titleMedium:
            input.copyWith(color: AppColors.darkThemeColors['textColor']),
        titleSmall:
            subtitle2.copyWith(color: AppColors.darkThemeColors['textColor']),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.grey),
      colorScheme: const ColorScheme.dark(background: AppColors.black),
    );
  }
}
