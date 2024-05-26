import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/errors/app_exception.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/auth/data/data_sources/interface/auth_data_source.dart';
import 'package:chat_task/features/auth/data/models/login_model.dart';

class RemoteAuthDataSource implements IAuthDataSource {
  final HttpClientService _client;

  RemoteAuthDataSource(this._client);

  @override
  Future<String> login(LoginModel login) async {
    try {
      Map response = await _client.post(ApiConsts.kLogin, data: login);
      if (!response.containsKey('token')) throw 'token is missed';
      return response['token'];
    } on AppException catch (e) {
      return Future.error(e.message);
    } catch (e) {
      return Future.error('Something went wrong');
    }
  }
}
