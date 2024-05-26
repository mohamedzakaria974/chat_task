import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/auth/data/data_sources/impl/remote_auth_data_source.dart';
import 'package:chat_task/features/auth/data/models/login_model.dart';
import 'package:chat_task/features/auth/data/repositories/authentication_repository.dart';
import 'package:chat_task/features/auth/domain/use_cases/login_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../core/utils/mock_http_client_service.dart';

void main() {
  late HttpClientService client;
  late RemoteAuthDataSource dataSource;
  late AuthenticationRepositoryImp authRepo;
  late LoginUseCase loginUseCase;
  LoginModel loginModel = const LoginModel(
    email: 'email',
    password: 'password',
  );
  setUp(() {
    client = MockHttpClientService();
    dataSource = RemoteAuthDataSource(client);
    authRepo = AuthenticationRepositoryImp(authDataSource: dataSource);
    loginUseCase = LoginUseCase(authRepo);
    when(client.post(
      ApiConsts.kLogin,
      data: anyNamed('data'),
    )).thenAnswer((_) async => {"token": "test-token"});
  });
  test('Test LoginUseCase behavior', () async {
    String token = await loginUseCase(loginModel);
    expect(token, 'test-token');
  });
}
