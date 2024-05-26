import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/errors/app_exception.dart';
import 'package:chat_task/core/utils/http_client_service.dart';
import 'package:chat_task/features/inbox/data/data_sources/interface/contacts_data_source.dart';
import 'package:chat_task/features/inbox/data/models/ContactModel.dart';

class RemoteContactsDataSource implements IContactsDataSource {
  final HttpClientService _client;

  RemoteContactsDataSource(this._client);

  @override
  Future<List<ContactModel>> getContactsList() async {
    try {
      List response = await _client.get(ApiConsts.kContacts);
      List<ContactModel> contacts = response
          .map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return contacts;
    } on AppException catch (e) {
      return Future.error(e.message);
    } catch (e) {
      return Future.error('Something went wrong');
    }
  }
}
