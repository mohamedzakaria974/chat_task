import 'package:bloc_test/bloc_test.dart';
import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/constants/storage_keys.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/core/utils/secure_storage_service.dart';
import 'package:chat_task/features/auth/data/data_sources/impl/remote_auth_data_source.dart';
import 'package:chat_task/features/auth/data/models/login_model.dart';
import 'package:chat_task/features/auth/data/repositories/authentication_repository.dart';
import 'package:chat_task/features/auth/domain/use_cases/login_use_case.dart';
import 'package:chat_task/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../core/utils/mock_http_client_service.dart';
import 'auth_bloc_test.mocks.dart';

@GenerateMocks([SecureStorageService])
void main() {
  group("Auth Bloc", () {
    late HttpClientService client;
    late RemoteAuthDataSource dataSource;
    late AuthenticationRepositoryImp authRepo;
    late LoginUseCase loginUseCase;
    late SecureStorageService storageService;
    late AuthBloc authBloc;
    LoginModel loginModel = const LoginModel(
      email: 'email',
      password: 'password',
    );
    setUp(() {
      client = MockHttpClientService();
      dataSource = RemoteAuthDataSource(client);
      authRepo = AuthenticationRepositoryImp(authDataSource: dataSource);
      loginUseCase = LoginUseCase(authRepo);
      storageService = MockSecureStorageService();
      authBloc = AuthBloc(
        loginUseCase: loginUseCase,
        storageService: storageService,
      );
      when(client.post(
        ApiConsts.kLogin,
        data: anyNamed('data'),
      )).thenAnswer((_) async => {"token": "test-token"});

      when(storageService.write(kTokenKey, 'test-token'))
          .thenAnswer((_) async {});
    });

    test(' have initial state as [AuthInitial] when initialized', () {
      expect(authBloc.state, isA<AuthInitial>());
    });

    blocTest<AuthBloc, AuthState>(
      'emit [AuthLoggedOutState] when [CheckLoggingInEvent] event occurs',
      setUp: () {
        when(storageService.read(kTokenKey)).thenAnswer((_) async => null);
      },
      build: () => authBloc,
      wait: Durations.short1,
      act: (b) => b.add(CheckLoggingInEvent()),
      expect: () => [
        AuthLoggedOutState(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emit [AuthLoggedInState] when [CheckLoggingInEvent] event occurs',
      setUp: () {
        when(storageService.read(kTokenKey))
            .thenAnswer((_) async => 'test-token');
      },
      build: () => authBloc,
      wait: Durations.short1,
      act: (b) => b.add(CheckLoggingInEvent()),
      expect: () => [
        AuthLoggedInState(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emit [ AuthLoadingState(), AuthLoggedInState()] '
      'when [LoginEvent] event occurs',
      setUp: () {
        when(storageService.read(kTokenKey))
            .thenAnswer((_) async => 'test-token');
      },
      build: () => authBloc,
      wait: Durations.short1,
      act: (b) => b.add(LoginEvent(loginEntity: loginModel)),
      expect: () => [
        AuthLoadingState(),
        AuthLoggedInState(),
      ],
    );
  });
}
