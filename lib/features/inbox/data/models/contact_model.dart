import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  const ContactModel({
    required this.id,
    required super.name,
    required this.email,
  });

  final int id;
  final String email;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );
}
