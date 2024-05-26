import 'package:chat_task/core/constants/strings.dart';
import 'package:test/test.dart';

void main() {
  group('Strings values should be:', () {
    test('`Strings.kUsage` label value', () {
      String usageLbl = 'استخدام';
      expect(Strings.kUsage, equals(usageLbl));
    });

    test('`Strings.kEmail` label value', () {
      String emailLbl = 'البريد الإلكترونى';
      expect(Strings.kEmail, equals(emailLbl));
    });

    test('`Strings.kPassword` label value', () {
      String passwordLbl = 'كلمة المرور';
      expect(Strings.kPassword, equals(passwordLbl));
    });

    test('`Strings.kPleaseEnterPassword` label value', () {
      String pleaseEnterPasswordMsg = 'يرجى إدخال كلمة المرور';
      expect(Strings.kPleaseEnterPassword, equals(pleaseEnterPasswordMsg));
    });

    test('`Strings.kForgotPassword` label value', () {
      String forgotPassword = 'نسيت كلمة المرور؟';
      expect(Strings.kForgotPassword, equals(forgotPassword));
    });

    test('`Strings.kLogin` label value', () {
      String loginLbl = 'تسجيل الدخول';
      expect(Strings.kLogin, equals(loginLbl));
    });

    test('`Strings.kDontHaveAnAccount` label value', () {
      String dontHaveAnAccount = 'ليس لديك حساب؟';
      expect(Strings.kDontHaveAnAccount, equals(dontHaveAnAccount));
    });

    test('`Strings.kCreateAnAccount` label value', () {
      String createAnAccount = 'إنشاء حساب';
      expect(Strings.kCreateAnAccount, equals(createAnAccount));
    });

    test('`Strings.kAskMeForLectures` label value', () {
      String askMeForLectures = 'اسألني عن محاضرتك..';
      expect(Strings.kAskMeForLectures, equals(askMeForLectures));
    });
  });
}
