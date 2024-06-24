import 'package:chat_task/features/auth/domain/entities/login_entity.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginEntity loginEntity;

  LoginEvent({required this.loginEntity});
}

class CheckLoggingInEvent extends AuthEvent {}
