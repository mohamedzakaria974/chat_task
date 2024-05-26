import 'package:chat_task/core/constants/failure_messages.dart';
import 'package:chat_task/core/utils/validator.dart';
import 'package:test/test.dart';

void main() {
  group('Validators behavior should be:', () {
    test('`Validators.requiredFieldValidator` behaviors', () {
      String emptyString = '';
      expect(
        Validator.requiredFieldValidator(emptyString),
        equals(kRequiredField),
      );

      String notEmptyString = 'xxx';
      expect(
        Validator.requiredFieldValidator(notEmptyString),
        isNull,
      );
    });

    test('`Validators.isEmailValid` behaviors', () {
      String emptyString = '';
      expect(
        Validator.isEmailValid(emptyString),
        isFalse,
      );

      String notValidEmailString = 'xxx';
      expect(
        Validator.isEmailValid(notValidEmailString),
        isFalse,
      );

      String validEmailString = 'test@test.com';
      expect(
        Validator.isEmailValid(validEmailString),
        isTrue,
      );
    });

    test('`Validators.validateEmail` behaviors', () {
      String emptyString = '';
      expect(
        Validator.validateEmail(emptyString),
        equals(kRequiredField),
      );

      String notValidEmailString = 'xxx';
      expect(
        Validator.validateEmail(notValidEmailString),
        equals(kInvalidEmail),
      );

      String validEmailString = 'test@test.com';
      expect(
        Validator.validateEmail(validEmailString),
        isNull,
      );
    });
  });
}
