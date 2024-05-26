import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String title;

  const ChatTile({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatPage(title: title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              BitesIcons.star,
              color: AppColors.purple,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
