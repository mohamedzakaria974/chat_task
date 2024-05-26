import 'package:chat_task/features/auth/domain/entities/login_entity.dart';

abstract interface class IAuthenticationRepository {
  Future<String> login(LoginEntity login);
}
