import 'package:chat_task/core/constants/assets.dart';
import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/features/chat/domain/entities/message.dart';
import 'package:chat_task/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/test_widget_util.dart';

void main() {
  group('MessageBubble must be', () {
    testWidgets(
      'Sent MessageBubble must be',
      (tester) async {
        await tester.pumpWidget(
          await getTestWidget(
            MessageBubble(
              message: Message(
                message: "test message",
                messageType: MessageType.sent,
              ),
            ),
          ),
        );

        final messageContainerFinder = find.byType(Container);
        expect(messageContainerFinder, findsOneWidget);
        final messageContainerWidget =
            messageContainerFinder.evaluate().first.widget as Container;
        final decoration = messageContainerWidget.decoration as BoxDecoration;
        expect(decoration.color, AppColors.purple);
        var borderRadius = decoration.borderRadius as BorderRadius;
        expect(borderRadius.bottomRight, isA<Radius>());
        expect(borderRadius.bottomRight.x, equals(0.0));
        expect(borderRadius.bottomRight.y, equals(0.0));

        expect(borderRadius.bottomLeft, isA<Radius>());
        expect(borderRadius.bottomLeft.x, equals(10.0));
        expect(borderRadius.bottomLeft.y, equals(10.0));

        expect(borderRadius.topRight, isA<Radius>());
        expect(borderRadius.topRight.x, equals(10.0));
        expect(borderRadius.topRight.y, equals(10.0));

        expect(borderRadius.topLeft, isA<Radius>());
        expect(borderRadius.topLeft.x, equals(10.0));
        expect(borderRadius.topLeft.y, equals(10.0));

        final starFinder = find.byIcon(BitesIcons.star);
        expect(starFinder, findsNothing);
        final messageTextFinder = find.text("test message");
        expect(messageTextFinder, findsOneWidget);

        final messageTextWidget =
            messageTextFinder.evaluate().first.widget as Text;
        expect(messageTextWidget.data, "test message");
        expect(messageTextWidget.style?.fontFamily, Assets.kFontFamily);
        expect(messageTextWidget.style?.color, AppColors.white);
        expect(messageTextWidget.style?.fontSize, 14.0);
        expect(messageTextWidget.style?.fontWeight, FontWeight.normal);
      },
    );

    testWidgets(
      'Received MessageBubble must be',
      (tester) async {
        await tester.pumpWidget(
          await getTestWidget(
            MessageBubble(
              message: Message(
                message: "test message",
                messageType: MessageType.received,
              ),
            ),
          ),
        );

        final messageContainerFinder = find.byType(Container);
        expect(messageContainerFinder, findsOneWidget);
        final messageContainerWidget =
            messageContainerFinder.evaluate().first.widget as Container;
        final decoration = messageContainerWidget.decoration as BoxDecoration;
        expect(decoration.color, AppColors.aliceBlue);
        var borderRadius = decoration.borderRadius as BorderRadius;
        expect(borderRadius.bottomLeft, isA<Radius>());
        expect(borderRadius.bottomLeft.x, equals(10.0));
        expect(borderRadius.bottomLeft.y, equals(10.0));

        expect(borderRadius.bottomRight, isA<Radius>());
        expect(borderRadius.bottomRight.x, equals(10.0));
        expect(borderRadius.bottomRight.y, equals(10.0));

        expect(borderRadius.topRight, isA<Radius>());
        expect(borderRadius.topRight.x, equals(10.0));
        expect(borderRadius.topRight.y, equals(10.0));

        expect(borderRadius.topLeft, isA<Radius>());
        expect(borderRadius.topLeft.x, equals(0.0));
        expect(borderRadius.topLeft.y, equals(0.0));

        final starFinder = find.byIcon(BitesIcons.star);
        expect(starFinder, findsOneWidget);
        final messageTextFinder = find.text("test message");
        expect(messageTextFinder, findsOneWidget);

        final messageTextWidget =
            messageTextFinder.evaluate().first.widget as Text;
        expect(messageTextWidget.data, "test message");
        expect(messageTextWidget.style?.fontFamily, Assets.kFontFamily);
        expect(messageTextWidget.style?.color, AppColors.grey30);
        expect(messageTextWidget.style?.fontSize, 14.0);
        expect(messageTextWidget.style?.fontWeight, FontWeight.normal);
      },
    );
  });
}
