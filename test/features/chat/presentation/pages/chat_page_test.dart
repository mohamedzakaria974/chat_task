import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/features/chat/presentation/pages/chat_page.dart';
import 'package:chat_task/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/test_widget_util.dart';

void main() {
  testWidgets(
    'ChatPage must contain',
    (tester) async {
      await tester.pumpWidget(
        await getTestWidget(
          const ChatPage(
            title: 'عنوان المحادثة',
          ),
        ),
      );
      final scaffoldFinder = find.byType(Scaffold);
      expect(scaffoldFinder, findsOneWidget);

      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);
      final appBarWidget = appBarFinder.evaluate().first.widget as AppBar;
      expect(appBarWidget.backgroundColor, AppColors.aliceBlue);
      expect(appBarWidget.centerTitle, true);
      final titleTextFinder = find.text('عنوان المحادثة');
      expect(titleTextFinder, findsOneWidget);

      final messageBubbleFinder = find.byType(MessageBubble);
      expect(messageBubbleFinder, findsAny);

      final cleanFinder = find.byIcon(BitesIcons.clean);
      expect(cleanFinder, findsOneWidget);
      final cleanIcon = cleanFinder.evaluate().first.widget as Icon;
      expect(cleanIcon.color, AppColors.purple);

      final textFormFieldFinder = find.byType(TextFormField);
      expect(textFormFieldFinder, findsOneWidget);

      final sendFinder = find.byIcon(BitesIcons.send);
      expect(sendFinder, findsOneWidget);
      final sendIcon = sendFinder.evaluate().first.widget as Icon;
      expect(sendIcon.color, AppColors.purple);
    },
  );
}
