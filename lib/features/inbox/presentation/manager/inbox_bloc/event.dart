import 'package:equatable/equatable.dart';

abstract class InboxEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InboxGetContacts extends InboxEvent {}
