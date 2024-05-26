import 'package:chat_task/core/constants/failure_messages.dart';
import 'package:test/test.dart';

void main() {
  group('Failure messages should be:', () {
    test('`kRequiredField` message value ', () {
      String kRequiredFieldPositiveTestValue = 'حقل مطلوب';
      expect(kRequiredField, equals(kRequiredFieldPositiveTestValue));
    });

    test('`kInvalidEmail` message value ', () {
      String kInvalidEmailPositiveTestValue = 'البريد الإلكترونى غير صحيح';
      expect(kInvalidEmail, equals(kInvalidEmailPositiveTestValue));
    });
  });
}
