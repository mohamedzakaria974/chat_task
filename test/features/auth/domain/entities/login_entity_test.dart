import 'package:chat_task/features/auth/domain/entities/login_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Test and Validate LoginEntity', () {
    String testPassword = '123456';
    String testEmail = 'test@test.com';
    var testData = LoginEntity(
      password: testPassword,
      email: testEmail,
    );

    expect(testData, isA<LoginEntity>());
    expect(testData.password, testPassword);
    expect(testData.email, testEmail);
  });
}
