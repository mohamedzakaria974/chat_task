import 'package:chat_task/core/di/di.dart' as di;
import 'package:chat_task/core/theme/app_theme.dart';
import 'package:chat_task/features/auth/presentation/pages/login_page.dart';
import 'package:chat_task/features/landing/presentation/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../features/auth/presentation/manager/auth_bloc.dart';

class ChatTaskApp extends StatelessWidget {
  const ChatTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<AuthBloc>()..add(CheckLoggingInEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'chat_task',
        themeMode: ThemeMode.light,
        theme: AppTheme.theme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        locale: const Locale('ar'),
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthLoggedInState) {
            return LandingScreen();
          } else {
            return const LoginPage();
          }
        }),
      ),
    );
  }
}
