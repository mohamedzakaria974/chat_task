import 'package:bloc_test/bloc_test.dart';
import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/inbox/data/data_sources/impl/remote_contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/models/contact_model.dart';
import 'package:chat_task/features/inbox/data/repositories/contacts_repository.dart';
import 'package:chat_task/features/inbox/domain/use_cases/get_contacts_list_use_case.dart';
import 'package:chat_task/features/inbox/presentation/manager/inbox_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../core/utils/mock_http_client_service.dart';

void main() {
  group("Inbox Bloc", () {
    late HttpClientService client;
    late RemoteContactsDataSource dataSource;
    late ContactsRepositoryImp contactsRepo;
    late GetContactsListUseCase getContactsListUseCase;
    late InboxBloc inboxBloc;

    tearDown(() => inboxBloc.close());

    setUp(() {
      client = MockHttpClientService();
      dataSource = RemoteContactsDataSource(client);
      contactsRepo = ContactsRepositoryImp(contactsDataSource: dataSource);
      getContactsListUseCase = GetContactsListUseCase(contactsRepo);
      inboxBloc = InboxBloc(getContactsListUseCase: getContactsListUseCase);
      List contacts = [
        {"id": 1, "name": "John", "email": "john@example.com"},
        {"id": 2, "name": "Alice", "email": "alice@example.com"},
      ];
      when(client.get(ApiConsts.kContacts)).thenAnswer((_) async => contacts);
    });

    test(' have initial state as [InboxInitial] when initialized', () {
      expect(inboxBloc.state, isA<InboxInitial>());
    });

    blocTest<InboxBloc, InboxState>(
        'emit [InboxLoadingState, InboxFetchContactsSuccessState] when [InboxGetContacts] event occurs',
        build: () => inboxBloc,
        wait: Durations.short1,
        act: (b) => b.add(InboxGetContacts()),
        expect: () => [
              InboxLoadingState(),
              InboxFetchContactsSuccessState(contacts: const [
                ContactModel(id: 1, name: 'John', email: "john@example.com"),
                ContactModel(id: 2, name: 'Alice', email: "alice@example.com"),
              ]),
            ],
        verify: (b) {
          expect(
              (b.state as InboxFetchContactsSuccessState).contacts.length, 2);
        });

    blocTest<InboxBloc, InboxState>(
        'emit [InboxLoadingState, InboxFetchContactsSuccessState] when [InboxGetContacts] event occurs',
        build: () => inboxBloc,
        wait: Durations.short1,
        act: (b) => b.add(InboxGetContacts()),
        expect: () => [
              InboxLoadingState(),
              InboxFetchContactsSuccessState(contacts: const [
                ContactModel(id: 1, name: 'John', email: "john@example.com"),
                ContactModel(id: 2, name: 'Alice', email: "alice@example.com"),
              ]),
            ],
        verify: (b) {
          expect(
              (b.state as InboxFetchContactsSuccessState).contacts.length, 2);
        });

    blocTest<InboxBloc, InboxState>(
      'emits [InboxLoadingState, InboxErrorState] when InboxGetContacts is added and getContactsListUseCase throws an error',
      build: () => inboxBloc,
      setUp: () {
        when(client.get(ApiConsts.kContacts)).thenThrow(Exception('error'));
      },
      act: (bloc) => bloc.add(InboxGetContacts()),
      expect: () => [
        InboxLoadingState(),
        InboxErrorState(message: 'Something went wrong'),
      ],
      verify: (_) {
        verify(client.get(ApiConsts.kContacts)).called(1);
      },
    );
  });
}
