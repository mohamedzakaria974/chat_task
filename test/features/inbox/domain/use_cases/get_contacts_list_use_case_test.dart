import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/inbox/data/data_sources/impl/remote_contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/models/contact_model.dart';
import 'package:chat_task/features/inbox/data/repositories/contacts_repository.dart';
import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';
import 'package:chat_task/features/inbox/domain/use_cases/get_contacts_list_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../core/utils/mock_http_client_service.dart';

void main() {
  late HttpClientService client;
  late RemoteContactsDataSource dataSource;
  late ContactsRepositoryImp authRepo;
  late GetContactsListUseCase getContactsListUseCase;

  setUp(() {
    client = MockHttpClientService();
    dataSource = RemoteContactsDataSource(client);
    authRepo = ContactsRepositoryImp(contactsDataSource: dataSource);
    getContactsListUseCase = GetContactsListUseCase(authRepo);
    List contacts = [
      {"id": 1, "name": "John", "email": "john@example.com"},
      {"id": 2, "name": "Alice", "email": "alice@example.com"},
    ];
    when(client.get(ApiConsts.kContacts)).thenAnswer((_) async => contacts);
  });
  test('Test GetContactsListUseCase behavior', () async {
    var contacts = await getContactsListUseCase();
    expect(contacts, isA<List<ContactEntity>>());
    expect(contacts.length, 2);
    expect((contacts.first as ContactModel).id, 1);
    expect((contacts.last as ContactModel).id, 2);
  });
}
