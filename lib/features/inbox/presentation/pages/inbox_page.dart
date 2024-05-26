import 'package:chat_task/core/constants/assets.dart';
import 'package:chat_task/core/constants/strings.dart';
import 'package:chat_task/core/di/di.dart' as di;
import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/features/inbox/presentation/manager/inbox_bloc.dart';
import 'package:chat_task/features/inbox/presentation/widgets/chat_tile.dart';
import 'package:chat_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  static const name = 'InboxPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<InboxBloc>()..add(InboxGetContacts()),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0) +
                  const EdgeInsets.only(top: 60),
              child: const Image(
                image: AssetImage(Assets.kIllustration),
                width: 140,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                Strings.kAskMeForLectures,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.purple,
                    ),
              ),
            ),
            Expanded(
              child: isUnitTest
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16) +
                          const EdgeInsets.only(top: 50),
                      itemCount: 4,
                      itemBuilder: (_, i) => const ChatTile(title: 'name'),
                    )
                  : BlocBuilder<InboxBloc, InboxState>(
                      builder: (context, state) {
                        if (state is InboxFetchContactsSuccessState) {
                          return ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16) +
                                    const EdgeInsets.only(top: 50),
                            itemCount: state.contacts.length,
                            itemBuilder: (_, i) => ChatTile(
                              title: state.contacts[i].name,
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
