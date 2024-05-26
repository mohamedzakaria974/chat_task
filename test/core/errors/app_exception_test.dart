import 'package:chat_task/core/errors/app_exception.dart';
import 'package:test/test.dart';

void main() {
  test('Test AppException', () {
    var testData = const AppException(message: 'message');
    expect(testData, isA<AppException>());
    expect(testData.message, equals('message'));
    expect(testData.statusCode, isNull);
    expect(testData.toString(), equals('[AppException] message'));
  });
}
