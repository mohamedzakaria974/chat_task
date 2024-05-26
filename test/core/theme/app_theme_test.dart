import 'package:chat_task/core/constants/assets.dart';
import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  group('AppTheme', () {
    test('light theme has expected properties', () {
      final theme = AppTheme.theme;

      expect(theme.textTheme.bodyMedium?.fontFamily, Assets.kFontFamily);
      expect(theme.textTheme.displayLarge?.fontFamily, Assets.kFontFamily);
      expect(theme.textTheme.labelSmall?.fontFamily, Assets.kFontFamily);
      expect(theme.primaryColor, AppColors.purple);
      expect(theme.visualDensity, VisualDensity.adaptivePlatformDensity);
      expect(theme.colorScheme.background, AppColors.white);

      expect(
          theme.inputDecorationTheme.focusedBorder, isA<OutlineInputBorder>());
      var focusedBorderRadius =
          (theme.inputDecorationTheme.focusedBorder as OutlineInputBorder)
              .borderRadius;
      expect(focusedBorderRadius, isA<BorderRadius>());
      expect(focusedBorderRadius.bottomLeft, isA<Radius>());
      expect(focusedBorderRadius.bottomLeft.x, equals(12.0));
      expect(focusedBorderRadius.bottomLeft.y, equals(12.0));

      expect(focusedBorderRadius.topLeft, isA<Radius>());
      expect(focusedBorderRadius.topLeft.x, equals(12.0));
      expect(focusedBorderRadius.topLeft.y, equals(12.0));

      expect(focusedBorderRadius.bottomRight, isA<Radius>());
      expect(focusedBorderRadius.bottomRight.x, equals(12.0));
      expect(focusedBorderRadius.bottomRight.y, equals(12.0));

      expect(focusedBorderRadius.topRight, isA<Radius>());
      expect(focusedBorderRadius.topRight.x, equals(12.0));
      expect(focusedBorderRadius.topRight.y, equals(12.0));

      var focusedBorderSide =
          (theme.inputDecorationTheme.focusedBorder as OutlineInputBorder)
              .borderSide;
      expect(focusedBorderSide, isA<BorderSide>());
      expect(focusedBorderSide.width, equals(1));
      expect(
          focusedBorderSide.color, equals(AppColors.purple.withOpacity(0.5)));

      expect(
          theme.inputDecorationTheme.focusedBorder, isA<OutlineInputBorder>());
      var focusedErrorBorderRadius =
          (theme.inputDecorationTheme.focusedBorder as OutlineInputBorder)
              .borderRadius;
      expect(focusedErrorBorderRadius, isA<BorderRadius>());
      expect(focusedErrorBorderRadius.bottomLeft, isA<Radius>());
      expect(focusedErrorBorderRadius.bottomLeft.x, equals(12.0));
      expect(focusedErrorBorderRadius.bottomLeft.y, equals(12.0));

      expect(focusedErrorBorderRadius.topLeft, isA<Radius>());
      expect(focusedErrorBorderRadius.topLeft.x, equals(12.0));
      expect(focusedErrorBorderRadius.topLeft.y, equals(12.0));

      expect(focusedErrorBorderRadius.bottomRight, isA<Radius>());
      expect(focusedErrorBorderRadius.bottomRight.x, equals(12.0));
      expect(focusedErrorBorderRadius.bottomRight.y, equals(12.0));

      expect(focusedErrorBorderRadius.topRight, isA<Radius>());
      expect(focusedErrorBorderRadius.topRight.x, equals(12.0));
      expect(focusedErrorBorderRadius.topRight.y, equals(12.0));

      var focusedErrorBorderSide =
          (theme.inputDecorationTheme.focusedErrorBorder as OutlineInputBorder)
              .borderSide;
      expect(focusedErrorBorderSide, isA<BorderSide>());
      expect(focusedErrorBorderSide.width, equals(1));
      expect(focusedErrorBorderSide.color, equals(AppColors.error));
    });
  });
}
