import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/features/chat/domain/entities/message.dart';
import 'package:chat_task/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String title;

  const ChatPage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.aliceBlue,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Message(
                      message: '''أهلاً فلان 👋
      بجاوبك على أي سؤال يخطر على بالك بشكل واضح وسريع وبساعدك تفهم المعلومة بشكل أفضل🚀''',
                      messageType: MessageType.received),
                  Message(
                      message: 'كيف يمكنني الـــ ؟',
                      messageType: MessageType.sent),
                  Message(
                      message:
                          'هذا نص عشوائي لملء الفراغ هذا نص عشوائي لملء الفراغ هذا نص عشوائي لملء الفراغ هذا نص عشوائي لملء الفراغ هذا نص عشوائي لملء الفراغ هذا نص عشوائي لملء الفراغ',
                      messageType: MessageType.received)
                ].map((e) => MessageBubble(message: e)).toList(),
              ),
            ),
            SafeArea(
              top: false,
              left: false,
              right: false,
              child: Container(
                height: 80,
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.dividerColor,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        BitesIcons.clean,
                        color: AppColors.purple,
                        size: 30,
                      ),
                      onPressed: () {},
                      splashColor: Colors.white,
                    ),
                    Expanded(
                      child: TextFormField(
                        maxLines: 1,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            BitesIcons.send,
                            size: 20,
                            color: AppColors.purple,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
