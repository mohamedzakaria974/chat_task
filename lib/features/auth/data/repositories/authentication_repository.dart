import 'package:chat_task/features/auth/data/data_sources/interface/auth_data_source.dart';
import 'package:chat_task/features/auth/data/models/login_model.dart';
import 'package:chat_task/features/auth/domain/entities/login_entity.dart';
import 'package:chat_task/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp implements IAuthenticationRepository {
  final IAuthDataSource authDataSource;

  AuthenticationRepositoryImp({required this.authDataSource});

  @override
  Future<String> login(LoginEntity login) async {
    try {
      final loginModel =
          LoginModel(email: login.email, password: login.password);
      final token = await authDataSource.login(loginModel);
      return token;
    } catch (_) {
      return Future.error('something went wrong');
    }
  }
}
