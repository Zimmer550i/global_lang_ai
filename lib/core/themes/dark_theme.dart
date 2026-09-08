import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';

ThemeData dark() => ThemeData(
  fontFamily: "Lato",
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.black.shade900,
  colorScheme: ColorScheme.dark(
    primary: AppColors.blue,
    secondary: AppColors.blue.shade300,
    surface: AppColors.black.shade800,
  ),
);
