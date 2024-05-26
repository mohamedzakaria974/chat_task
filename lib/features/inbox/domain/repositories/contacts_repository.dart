import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';

abstract interface class IContactsRepository {
  Future<List<ContactEntity>> getContactsList();
}
