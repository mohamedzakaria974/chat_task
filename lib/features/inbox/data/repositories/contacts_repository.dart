import 'package:chat_task/features/inbox/data/data_sources/interface/contacts_data_source.dart';
import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';
import 'package:chat_task/features/inbox/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImp implements IContactsRepository {
  final IContactsDataSource contactsDataSource;

  ContactsRepositoryImp({required this.contactsDataSource});

  @override
  Future<List<ContactEntity>> getContactsList() async {
    try {
      final contacts = await contactsDataSource.getContactsList();
      return contacts;
    } catch (_) {
      return Future.error('something went wrong');
    }
  }
}
