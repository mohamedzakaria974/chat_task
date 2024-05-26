import 'package:chat_task/features/inbox/data/models/ContactModel.dart';

abstract class IContactsDataSource {
  Future<List<ContactModel>> getContactsList();
}
