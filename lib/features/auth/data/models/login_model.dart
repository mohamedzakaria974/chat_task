import 'package:chat_task/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.email, required super.password});

  Map<String, String> toJson() {
    return {
      'username': email,
      'password': password,
    };
  }
}
