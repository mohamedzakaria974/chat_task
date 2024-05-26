import 'package:chat_task/features/inbox/domain/entities/contact_entity.dart';
import 'package:equatable/equatable.dart';

abstract class InboxState extends Equatable {
  @override
  List<Object> get props => [];
}

class InboxInitial extends InboxState {}

class InboxLoadingState extends InboxState {}

class InboxFetchContactsSuccessState extends InboxState {
  final List<ContactEntity> contacts;

  InboxFetchContactsSuccessState({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class InboxErrorState extends InboxState {
  final String message;
  final bool isSilent;

  InboxErrorState({required this.message, this.isSilent = false});

  @override
  List<Object> get props => [message, isSilent];
}
