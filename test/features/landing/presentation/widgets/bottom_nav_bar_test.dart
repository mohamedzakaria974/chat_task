import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/features/landing/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/test_widget_util.dart';

void main() {
  testWidgets(
    'BottomNavBar must contain',
    (tester) async {
      await tester.pumpWidget(await getTestWidget(const BottomNavBar()));

      final floatingBtnFinder = find.byType(FloatingActionButton);
      expect(floatingBtnFinder, findsOneWidget);
      final floatingBtnWidget =
          floatingBtnFinder.evaluate().first.widget as FloatingActionButton;
      expect(floatingBtnWidget.shape, isA<CircleBorder>());
      expect(floatingBtnWidget.backgroundColor, equals(AppColors.purple));
      expect(floatingBtnWidget.child, isA<Icon>());

      final plusIcon = floatingBtnWidget.child as Icon;
      expect(plusIcon.icon, equals(BitesIcons.addPlus));
      expect(plusIcon.color, equals(AppColors.white));

      final calendarFinder = find.byIcon(BitesIcons.calendar);
      expect(calendarFinder, findsOneWidget);

      final clockFinder = find.byIcon(BitesIcons.clock);
      expect(clockFinder, findsOneWidget);

      final notificationFinder = find.byIcon(BitesIcons.notification);
      expect(notificationFinder, findsOneWidget);

      final userFinder = find.byIcon(BitesIcons.user);
      expect(userFinder, findsOneWidget);
    },
  );
}
