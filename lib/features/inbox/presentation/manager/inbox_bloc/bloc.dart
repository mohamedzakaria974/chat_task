import 'package:chat_task/features/inbox/domain/use_cases/get_contacts_list_use_case.dart';
import 'package:chat_task/features/inbox/presentation/manager/inbox_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final GetContactsListUseCase getContactsListUseCase;

  InboxBloc({
    required this.getContactsListUseCase,
  }) : super(InboxInitial()) {
    on<InboxEvent>((event, emit) async {
      if (event is InboxGetContacts) {
        emit(InboxLoadingState());
        try {
          final contacts = await getContactsListUseCase();
          emit(InboxFetchContactsSuccessState(contacts: contacts));
        } catch (_) {
          emit(InboxErrorState(message: 'Something went wrong'));
        }
      }
    });
  }
}
