// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:taskkkk_app/core/utils/color.dart';
import 'package:taskkkk_app/core/utils/style.dart';

class AppThemes {
  static ThemeData appLightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.white, foregroundColor: AppColor.primary),
         colorScheme: ColorScheme.fromSeed(
          primary: AppColor.primary,
          background: AppColor.white,
          onSurface: AppColor.black,
          error: AppColor.pink,
          seedColor: AppColor.primary),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColor.white,
      ),

      timePickerTheme: TimePickerThemeData(backgroundColor: AppColor.white),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallStyle(),
          prefixIconColor: AppColor.primary,
          suffixIconColor: AppColor.primary,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary)
              ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary)
              ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.pink)
              ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.pink)
              )
              )
              );
  static ThemeData appDarkTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.dark,
      datePickerTheme: DatePickerThemeData(backgroundColor: AppColor.dark),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.dark, foregroundColor: AppColor.primary),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColor.dark,
        dialBackgroundColor: AppColor.dark,
      ),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColor.primary,
          background: AppColor.dark,
          onSurface: AppColor.white,
          seedColor: AppColor.primary),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallStyle(),
          prefixIconColor: AppColor.primary,
          suffixIconColor: AppColor.primary,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.pink)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.pink))));
}
