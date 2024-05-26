import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoggedInState extends AuthState {}

class AuthLoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
