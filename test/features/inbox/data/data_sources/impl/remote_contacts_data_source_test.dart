import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/errors/app_exception.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/inbox/data/data_sources/impl/remote_contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/data_sources/interface/contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/models/contact_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../core/utils/mock_http_client_service.dart';

void main() {
  group('RemoteContactsDataSource', () {
    late HttpClientService mockHttpClient;
    late RemoteContactsDataSource dataSource;

    setUp(() {
      mockHttpClient = MockHttpClientService();
      dataSource = RemoteContactsDataSource(mockHttpClient);
    });

    test('getContactsList returns a list of ContactModel on success', () async {
      // Arrange
      final List<Map<String, dynamic>> mockResponse = [
        {"id": 1, "name": "John", "email": "john@example.com"},
        {"id": 2, "name": "Alice", "email": "alice@example.com"},
      ];
      when(mockHttpClient.get(ApiConsts.kContacts))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await dataSource.getContactsList();

      // Assert
      expect(dataSource, isA<IContactsDataSource>());
      expect(result.length,
          2); // Ensure the correct number of contacts are returned
      expect(result[0], isA<ContactModel>());
      expect(result[1], isA<ContactModel>());
      // Add more specific assertions for ContactModel properties if needed
    });

    test('getContactsList throws an error on AppException', () async {
      // Arrange
      when(mockHttpClient.get(ApiConsts.kContacts))
          .thenThrow(const AppException(message: 'Custom error'));

      // Act
      final result = dataSource.getContactsList();

      // Assert
      await expectLater(() => result, throwsA('Custom error'));
    });

    test('getContactsList throws a generic error on other exceptions',
        () async {
      // Arrange
      when(mockHttpClient.get(ApiConsts.kContacts)).thenThrow(Exception());

      // Act
      final result = dataSource.getContactsList();

      // Assert
      await expectLater(() => result, throwsA('Something went wrong'));
    });
  });
}
