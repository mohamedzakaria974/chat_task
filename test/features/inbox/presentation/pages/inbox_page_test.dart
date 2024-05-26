import 'package:chat_task/core/constants/assets.dart';
import 'package:chat_task/core/constants/strings.dart';
import 'package:chat_task/features/inbox/presentation/pages/inbox_page.dart';
import 'package:chat_task/features/inbox/presentation/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/test_widget_util.dart';

void main() {
  testWidgets(
    'InboxPage must contain',
    (tester) async {
      await tester.pumpWidget(await getTestWidget(const InboxPage()));

      final illustrationFinder = find.byType(Image);
      expect(illustrationFinder, findsOneWidget);
      Image illustrationImgWidget =
          illustrationFinder.evaluate().first.widget as Image;
      expect(
        (illustrationImgWidget.image as AssetImage).assetName,
        Assets.kIllustration,
      );
      final askForLectureFinder = find.text(Strings.kAskMeForLectures);
      expect(askForLectureFinder, findsOneWidget);

      final chatsListFinder = find.byType(ListView);
      expect(chatsListFinder, findsOneWidget);
      final chatsTileFinder = find.byType(ChatTile);
      expect(chatsTileFinder, findsAtLeast(1));
    },
  );
}
