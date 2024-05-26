import 'package:chat_task/features/auth/data/models/login_model.dart';

abstract class IAuthDataSource {
  Future<String> login(LoginModel login);
}
