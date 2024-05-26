import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/features/chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.messageType == MessageType.sent
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: message.messageType == MessageType.sent
                  ? AppColors.purple
                  : AppColors.aliceBlue,
              borderRadius: message.messageType == MessageType.sent
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
            ),
            child: Text(
              message.message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: message.messageType == MessageType.sent
                        ? AppColors.white
                        : AppColors.grey30,
                  ),
            ),
          ),
        ),
        if (message.messageType == MessageType.received)
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Icon(
              BitesIcons.star,
              color: AppColors.purple,
            ),
          ),
      ],
    );
  }
}
