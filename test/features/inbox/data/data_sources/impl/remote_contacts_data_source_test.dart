import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/inbox/data/data_sources/impl/remote_contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/data_sources/interface/contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/models/ContactModel.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../core/utils/mock_http_client_service.dart';

void main() {
  late HttpClientService client;
  late RemoteContactsDataSource dataSource;
  setUp(() {
    client = MockHttpClientService();
    dataSource = RemoteContactsDataSource(client);
    List contacts = [
      {"id": 1, "name": "John", "email": "john@example.com"},
      {"id": 2, "name": "Alice", "email": "alice@example.com"},
    ];
    when(client.get(ApiConsts.kContacts)).thenAnswer((_) async => contacts);
  });
  test('Test RemoteContactsDataSource behavior', () async {
    expect(dataSource, isA<IContactsDataSource>());
    var contacts = await dataSource.getContactsList();
    expect(contacts, isA<List<ContactModel>>());
    expect(contacts.length, 2);
  });
}
