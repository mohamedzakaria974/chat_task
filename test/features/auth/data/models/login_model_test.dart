import 'package:chat_task/features/auth/data/models/login_model.dart';
import 'package:chat_task/features/auth/domain/entities/login_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Test and Validate LoginModel', () {
    String testPassword = '123456';
    String testEmail = 'test@test.com';
    Map testToJson = {
      'username': testEmail,
      'password': testPassword,
    };
    var testData = LoginModel(
      password: testPassword,
      email: testEmail,
    );

    expect(testData, isA<LoginModel>());
    expect(testData, isA<LoginEntity>());
    expect(testData.password, testPassword);
    expect(testData.email, testEmail);
    expect(testData.toJson(), testToJson);
  });
}
