import 'package:chat_task/core/constants/widget_keys.dart' as keys;
import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/features/inbox/presentation/pages/inbox_page.dart';
import 'package:chat_task/features/landing/presentation/pages/landing_page.dart';
import 'package:chat_task/features/landing/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/test_widget_util.dart';

void main() {
  testWidgets('LandingScreen widget renders without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(await getTestWidget(LandingScreen()));

    expect(find.byType(LandingScreen), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(BottomNavBar), findsOneWidget);
  });

  testWidgets('LandingScreen applies correct gradient decoration',
      (WidgetTester tester) async {
    await tester.pumpWidget(await getTestWidget(LandingScreen()));

    final containerFinder = find.descendant(
      of: find.byType(LandingScreen),
      matching: find.byKey(keys.kGradientContainerKey),
    );

    expect(containerFinder, findsOneWidget);
    final Container container = tester.widget(containerFinder);
    expect(container.decoration, isA<BoxDecoration>());

    final BoxDecoration decoration = container.decoration as BoxDecoration;
    expect(decoration.gradient, isA<RadialGradient>());
    RadialGradient gradient = decoration.gradient as RadialGradient;

    expect(gradient.center, Alignment.center);
    expect(gradient.radius, 2.0);
    expect(gradient.colors,
        [AppColors.darkPurple.withAlpha(24), AppColors.skyBlue.withAlpha(24)]);
  });

  testWidgets('LandingScreen displays correct page widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(await getTestWidget(LandingScreen()));

    final pageFinder = find.byType(InboxPage);
    expect(pageFinder, findsOneWidget);
  });
}
