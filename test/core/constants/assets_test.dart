import 'package:chat_task/core/constants/assets.dart';
import 'package:test/test.dart';

void main() {
  group('assets values should be:', () {
    test('`Assets.kFontFamily` must be `Cairo`', () {
      String fontFamily = 'Cairo';
      expect(Assets.kFontFamily, equals(fontFamily));
    });

    test('`Assets.kLogo` value', () {
      String kLogoPath = 'assets/images/logo.png';
      expect(Assets.kLogo, equals(kLogoPath));
    });

    test('`Assets.kIllustration` value', () {
      String kIllustrationPath = 'assets/images/illustration.png';
      expect(Assets.kIllustration, equals(kIllustrationPath));
    });

    test('`Assets.kGoogle` value', () {
      String kGooglePath = 'assets/icons/google.svg';
      expect(Assets.kGoogle, equals(kGooglePath));
    });
  });
}
