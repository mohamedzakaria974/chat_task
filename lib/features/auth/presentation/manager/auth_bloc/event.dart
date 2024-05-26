import 'package:chat_task/features/auth/domain/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginEntity loginEntity;

  LoginEvent({required this.loginEntity});

  @override
  List<Object> get props => [LoginEntity];
}

class CheckLoggingInEvent extends AuthEvent {}
