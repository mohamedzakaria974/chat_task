import 'package:chat_task/core/constants/assets.dart';
import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => _light;
  static final OutlineInputBorder _textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.purple.withOpacity(0.5)),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );
  static const OutlineInputBorder _errorTextFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
  static final _light = ThemeData(
      fontFamily: Assets.kFontFamily,
      primaryColor: AppColors.purple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            background: AppColors.white,
          ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) => const Icon(
          BitesIcons.arrow,
          size: 20,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: _textFieldBorder,
        focusedErrorBorder: _errorTextFieldBorder,
        enabledBorder: _textFieldBorder,
        border: _textFieldBorder,
        disabledBorder: _textFieldBorder,
        errorBorder: _errorTextFieldBorder,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
      )));
}
