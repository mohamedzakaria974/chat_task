import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String email;
  final String password;

  const LoginEntity({required this.password, required this.email});

  @override
  List<Object?> get props => [password, email];
}
