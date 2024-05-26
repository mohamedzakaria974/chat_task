import 'package:chat_task/core/constants/storage_keys.dart';
import 'package:test/test.dart';

void main() {
  test('Test storage keys', () {
    String successTestData = '_chat_jwt_token_';
    expect(kTokenKey, successTestData);
  });
}
