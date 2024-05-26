import 'package:chat_task/features/inbox/data/models/ContactModel.dart';
import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Test ContactModel values', () {
    int testId = 1;
    String testName = 'Mohamed';
    String testEmail = 'test@test.com';
    Map<String, dynamic> json = {
      'id': testId,
      'email': testEmail,
      'name': testName,
    };
    var testData = ContactModel(
      id: testId,
      name: testName,
      email: testEmail,
    );

    expect(testData, isA<ContactModel>());
    expect(testData, isA<ContactEntity>());
    expect(testData.id, testId);
    expect(testData.email, testEmail);
    expect(testData.name, testName);

    var fromJson = ContactModel.fromJson(json);
    expect(fromJson, isA<ContactModel>());

    expect(fromJson.id, testId);
    expect(fromJson.email, testEmail);
    expect(fromJson.name, testName);
  });
}
