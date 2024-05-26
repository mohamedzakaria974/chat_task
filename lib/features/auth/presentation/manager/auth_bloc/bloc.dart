import 'package:chat_task/core/constants/storage_keys.dart';
import 'package:chat_task/core/utils/secure_storage_service.dart';
import 'package:chat_task/features/auth/domain/use_cases/login_use_case.dart';
import 'package:chat_task/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SecureStorageService storageService;

  AuthBloc({
    required this.loginUseCase,
    required this.storageService,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is CheckLoggingInEvent) {
        String? token = await storageService.read(kTokenKey);
        if (token?.isNotEmpty ?? false) {
          emit(AuthLoggedInState());
        } else {
          emit(AuthLoggedOutState());
        }
      } else if (event is LoginEvent) {
        try {
          emit(AuthLoadingState());
          final token = await loginUseCase(event.loginEntity);
          await storageService.write(kTokenKey, token);
          emit(AuthLoggedInState());
        } catch (e) {
          emit(AuthErrorState(message: 'something went wrong'));
        }
      }
    });
  }
}
