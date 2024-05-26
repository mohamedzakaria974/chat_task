import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/auth/data/data_sources/impl/remote_auth_data_source.dart';
import 'package:chat_task/features/auth/data/data_sources/interface/auth_data_source.dart';
import 'package:chat_task/features/auth/data/models/login_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../core/utils/mock_http_client_service.dart';

void main() {
  late HttpClientService client;
  late RemoteAuthDataSource dataSource;
  LoginModel loginModel = const LoginModel(
    email: 'email',
    password: 'password',
  );
  setUp(() {
    client = MockHttpClientService();
    dataSource = RemoteAuthDataSource(client);
    when(client.post(
      ApiConsts.kLogin,
      data: anyNamed('data'),
    )).thenAnswer((_) async => {"token": "test-token"});
  });
  test('Test RemoteAuthDataSource behavior', () async {
    expect(dataSource, isA<IAuthDataSource>());
    String token = await dataSource.login(loginModel);
    expect(token, 'test-token');
  });
}
