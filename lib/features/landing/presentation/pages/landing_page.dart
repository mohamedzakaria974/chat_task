import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/features/inbox/presentation/pages/inbox_page.dart';
import 'package:chat_task/features/landing/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  final _pagesWidgets = {
    InboxPage.name: const InboxPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: const BottomNavBar(),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            // Defines the center of the gradient
            center: Alignment.center,
            // Controls the spread of the gradient
            radius: 2.0, // Adjust as needed (larger value spreads further)
            // Defines color stops and transitions
            colors: [
              AppColors.darkPurple.withAlpha(24),
              AppColors.skyBlue.withAlpha(24)
            ],
          ),
        ),
        child: _pagesWidgets[InboxPage.name],
      ),
    );
  }
}
