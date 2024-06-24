import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/errors/app_exception.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/auth/data/data_sources/impl/remote_auth_data_source.dart';
import 'package:chat_task/features/auth/data/models/login_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../core/utils/mock_http_client_service.dart';

void main() {
  group('AuthService', () {
    late RemoteAuthDataSource authService;
    late HttpClientService mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClientService();
      authService = RemoteAuthDataSource(mockHttpClient);
    });

    test('should return token when login is successful', () async {
      const loginModel = LoginModel(email: 'test', password: 'test');
      final response = {'token': '12345'};

      when(mockHttpClient.post(ApiConsts.kLogin, data: loginModel))
          .thenAnswer((_) async => response);

      final token = await authService.login(loginModel);

      expect(token, '12345');
    });

    test('should throw error when token is missing', () async {
      const loginModel = LoginModel(email: 'test', password: 'test');
      final response = {'no_token': '12345'};

      when(mockHttpClient.post(ApiConsts.kLogin, data: loginModel))
          .thenAnswer((_) async => response);

      expect(
          () => authService.login(loginModel), throwsA('Something went wrong'));
    });

    test('should return AppException error message when AppException is thrown',
        () async {
      const loginModel = LoginModel(email: 'test', password: 'test');
      const exceptionMessage = 'Invalid credentials';

      when(mockHttpClient.post(ApiConsts.kLogin, data: loginModel))
          .thenThrow(const AppException(message: exceptionMessage));

      expect(() => authService.login(loginModel), throwsA(exceptionMessage));
    });

    test('should return generic error message when an exception is thrown',
        () async {
      const loginModel = LoginModel(email: 'test', password: 'test');

      when(mockHttpClient.post(ApiConsts.kLogin, data: loginModel))
          .thenThrow(Exception('Unexpected error'));

      expect(
          () => authService.login(loginModel), throwsA('Something went wrong'));
    });
  });
}
