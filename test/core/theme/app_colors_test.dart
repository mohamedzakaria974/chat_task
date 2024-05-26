import 'package:chat_task/core/theme/app_colors.dart';
import 'package:test/test.dart';

void main() {
  group('App Colors values should be', () {
    test('test `AppColors.white` value', () {
      expect(AppColors.white.value, isA<int>());
      int whiteColorValue = 0xFFFFFFFF;
      expect(AppColors.white.value, equals(whiteColorValue));
    });

    test('test `AppColors.purple` value', () {
      expect(AppColors.purple.value, isA<int>());
      int purpleColorValue = 0xFF6061F0;
      expect(AppColors.purple.value, equals(purpleColorValue));
    });

    test('test `AppColors.error` value', () {
      expect(AppColors.error.value, isA<int>());
      int errorColorValue = 0xFFF44336;
      expect(AppColors.error.value, equals(errorColorValue));
    });

    test('test `AppColors.darkPurple` value', () {
      expect(AppColors.darkPurple.value, isA<int>());
      int darkPurpleColorValue = 0xFF6047ED;
      expect(AppColors.darkPurple.value, equals(darkPurpleColorValue));
    });

    test('test `AppColors.grey` value', () {
      expect(AppColors.grey.value, isA<int>());
      int greyColorValue = 0xFF8F9BB3;
      expect(AppColors.grey.value, equals(greyColorValue));
    });

    test('test `AppColors.grey30` value', () {
      expect(AppColors.grey30.value, isA<int>());
      int grey30ColorValue = 0xFF4D4D4D;
      expect(AppColors.grey30.value, equals(grey30ColorValue));
    });

    test('test `AppColors.skyBlue` value', () {
      expect(AppColors.skyBlue.value, isA<int>());
      int skyBlueColorValue = 0xFF00D1FF;
      expect(AppColors.skyBlue.value, equals(skyBlueColorValue));
    });

    test('test `AppColors.softBlue` value', () {
      expect(AppColors.softBlue.value, isA<int>());
      int softBlueColorValue = 0xFF86A8E7;
      expect(AppColors.softBlue.value, equals(softBlueColorValue));
    });

    test('test `AppColors.aliceBlue` value', () {
      expect(AppColors.aliceBlue.value, isA<int>());
      int aliceBlueColorValue = 0xFFF3F6FD;
      expect(AppColors.aliceBlue.value, equals(aliceBlueColorValue));
    });

    test('test `AppColors.dartBlue` value', () {
      expect(AppColors.dartBlue.value, isA<int>());
      int dartBlueColorValue = 0xFF222B45;
      expect(AppColors.dartBlue.value, equals(dartBlueColorValue));
    });

    test('test `AppColors.dividerColor` value', () {
      expect(AppColors.dividerColor.value, isA<int>());
      int dividerColorColorValue = 0xFFE3E8EF;
      expect(AppColors.dividerColor.value, equals(dividerColorColorValue));
    });
  });
}
