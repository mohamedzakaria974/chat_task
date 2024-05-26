import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/core/utils/secure_storage_service.dart';
import 'package:chat_task/features/auth/data/data_sources/impl/remote_auth_data_source.dart';
import 'package:chat_task/features/auth/data/data_sources/interface/auth_data_source.dart';
import 'package:chat_task/features/auth/data/repositories/authentication_repository.dart';
import 'package:chat_task/features/auth/domain/repositories/authentication_repository.dart';
import 'package:chat_task/features/auth/domain/use_cases/login_use_case.dart';
import 'package:chat_task/features/auth/presentation/manager/auth_bloc.dart';
import 'package:chat_task/features/inbox/data/data_sources/impl/remote_contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/data_sources/interface/contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/repositories/contacts_repository.dart';
import 'package:chat_task/features/inbox/domain/repositories/contacts_repository.dart';
import 'package:chat_task/features/inbox/domain/use_cases/get_contacts_list_use_case.dart';
import 'package:chat_task/features/inbox/presentation/manager/inbox_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
bool _initiated = false;

Future<void> init() async {
  if (_initiated) return;
  // Bloc
  locator.registerFactory(
    () => AuthBloc(
      loginUseCase: locator(),
      storageService: locator(),
    ),
  );
  locator.registerFactory(() => InboxBloc(getContactsListUseCase: locator()));

  // Use Cases
  locator.registerLazySingleton(() => LoginUseCase(locator()));
  locator.registerLazySingleton(() => GetContactsListUseCase(locator()));

  // Repository
  locator.registerLazySingleton<IAuthenticationRepository>(
      () => AuthenticationRepositoryImp(authDataSource: locator()));

  locator.registerLazySingleton<IContactsRepository>(
      () => ContactsRepositoryImp(contactsDataSource: locator()));

  // Data Sources
  locator.registerLazySingleton<IAuthDataSource>(
    () => RemoteAuthDataSource(locator()),
  );

  locator.registerLazySingleton<IContactsDataSource>(
    () => RemoteContactsDataSource(locator()),
  );

  // HTTP Client
  locator.registerLazySingleton<HttpClientService>(
    () => HttpClientService(),
  );

  // Local Storage
  locator.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );
  _initiated = true;
}
