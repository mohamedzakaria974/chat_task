import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/features/inbox/presentation/widgets/chat_tile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/test_widget_util.dart';

void main() {
  testWidgets(
    'ChatTile must contain',
    (tester) async {
      await tester.pumpWidget(
        await getTestWidget(
          const ChatTile(
            title: 'عنوان المحادثة',
          ),
        ),
      );

      final starFinder = find.byIcon(BitesIcons.star);
      expect(starFinder, findsOneWidget);

      final titleFinder = find.text('عنوان المحادثة');
      expect(titleFinder, findsOneWidget);
    },
  );
}
