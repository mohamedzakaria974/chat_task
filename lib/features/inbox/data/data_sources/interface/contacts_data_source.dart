import 'package:chat_task/features/inbox/data/models/contact_model.dart';

abstract class IContactsDataSource {
  Future<List<ContactModel>> getContactsList();
}
