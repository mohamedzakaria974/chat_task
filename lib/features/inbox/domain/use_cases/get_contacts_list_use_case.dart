import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';
import 'package:chat_task/features/inbox/domain/repositories/contacts_repository.dart';

class GetContactsListUseCase {
  final IContactsRepository repository;

  GetContactsListUseCase(this.repository);

  Future<List<ContactEntity>> call() async {
    return await repository.getContactsList();
  }
}
