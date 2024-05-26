import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Test ContactEntity values', () {
    var testData = const ContactEntity(name: 'testName');
    expect(testData, isA<ContactEntity>());
    expect(testData.name, 'testName');
  });
}
