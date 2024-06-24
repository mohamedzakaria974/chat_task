import 'package:chat_task/app/chat_task_app.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/core/utils/secure_storage_service.dart';
import 'package:chat_task/features/auth/data/data_sources/impl/remote_auth_data_source.dart';
import 'package:chat_task/features/auth/data/data_sources/interface/auth_data_source.dart';
import 'package:chat_task/features/auth/domain/repositories/authentication_repository.dart';
import 'package:chat_task/features/auth/domain/use_cases/login_use_case.dart';
import 'package:chat_task/features/auth/presentation/manager/auth_bloc.dart';
import 'package:chat_task/features/inbox/data/data_sources/impl/remote_contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/data_sources/interface/contacts_data_source.dart';
import 'package:chat_task/features/inbox/domain/repositories/contacts_repository.dart';
import 'package:chat_task/features/inbox/domain/use_cases/get_contacts_list_use_case.dart';
import 'package:chat_task/features/inbox/presentation/manager/inbox_bloc.dart';
import 'package:chat_task/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUp(() {
    final locator = GetIt.instance;
    locator.reset(); // Reset instance before each test
  });
  testWidgets('main function initializes dependencies and runs ChatTaskApp',
      (WidgetTester tester) async {
    // Run the main function
    await app.main();

    // Verify that runApp is called with ChatTaskApp
    expect(find.byType(ChatTaskApp), findsOneWidget);
    final locator = GetIt.instance;

    // Verify Blocs
    expect(locator<AuthBloc>(), isNotNull);
    expect(locator<InboxBloc>(), isNotNull);

    // Verify Use Cases
    expect(locator<LoginUseCase>(), isNotNull);
    expect(locator<GetContactsListUseCase>(), isNotNull);

    // Verify Repositories
    expect(locator<IAuthenticationRepository>(), isNotNull);
    expect(locator<IContactsRepository>(), isNotNull);

    // Verify Data Sources
    expect(locator<IAuthDataSource>(), isA<RemoteAuthDataSource>());
    expect(locator<IContactsDataSource>(), isA<RemoteContactsDataSource>());

    // Verify HTTP Client
    expect(locator<HttpClientService>(), isNotNull);

    // Verify Local Storage
    expect(locator<SecureStorageService>(), isNotNull);
  });
}
