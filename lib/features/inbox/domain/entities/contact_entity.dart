import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String name;

  const ContactEntity({required this.name});

  @override
  List<Object?> get props => [name];
}
