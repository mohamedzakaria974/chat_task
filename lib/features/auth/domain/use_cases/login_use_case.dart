import 'package:chat_task/features/auth/domain/entities/login_entity.dart';

import '../repositories/authentication_repository.dart';

class LoginUseCase {
  final IAuthenticationRepository repository;

  LoginUseCase(this.repository);

  Future<String> call(LoginEntity login) async {
    return await repository.login(login);
  }
}
