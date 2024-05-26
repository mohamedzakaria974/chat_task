import 'package:chat_task/core/constants/api_consts.dart';
import 'package:test/test.dart';

void main() {
  group('ApiConsts values should be:', () {
    test('`ApiConsts.kBaseUrl` value', () {
      String kBaseUrlTestValue = 'https://mobile-dev-assignment.fly.dev/';
      expect(ApiConsts.kBaseUrl, equals(kBaseUrlTestValue));
    });

    test('`ApiConsts.kLogin` value', () {
      String kLoginTestValue = 'login/';
      expect(ApiConsts.kLogin, equals(kLoginTestValue));
    });

    test('`ApiConsts.kContacts` value', () {
      String kContactsTestValue = 'contacts/';
      expect(ApiConsts.kContacts, equals(kContactsTestValue));
    });
  });
}
