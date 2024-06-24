import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/auth/data/data_sources/impl/remote_auth_data_source.dart';
import 'package:chat_task/features/auth/data/models/login_model.dart';
import 'package:chat_task/features/auth/data/repositories/authentication_repository.dart';
import 'package:chat_task/features/auth/domain/entities/login_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../core/utils/mock_http_client_service.dart';

void main() {
  group('AuthenticationRepositoryImp', () {
    late HttpClientService client;
    late AuthenticationRepositoryImp authenticationRepository;
    late RemoteAuthDataSource dataSource;

    setUp(() {
      client = MockHttpClientService();
      dataSource = RemoteAuthDataSource(client);
      authenticationRepository =
          AuthenticationRepositoryImp(authDataSource: dataSource);
    });

    test('should return token when login is successful', () async {
      const loginEntity = LoginEntity(
        email: 'test@example.com',
        password: 'password',
      );
      const loginModel = LoginModel(
        email: 'test@example.com',
        password: 'password',
      );
      const token = '12345';
      final response = {'token': token};
      when(client.post(ApiConsts.kLogin, data: loginModel))
          .thenAnswer((_) async => response);

      final result = await authenticationRepository.login(loginEntity);

      expect(result, token);
    });

    test('should return error when authDataSource throws an exception',
        () async {
      const loginEntity = LoginEntity(
        email: 'test@example.com',
        password: 'password',
      );
      const loginModel = LoginModel(
        email: 'test@example.com',
        password: 'password',
      );
      when(client.post(ApiConsts.kLogin, data: loginModel))
          .thenThrow(Exception('Unexpected error'));
      expect(() => authenticationRepository.login(loginEntity),
          throwsA('something went wrong'));
    });
  });
}
