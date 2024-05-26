import 'package:chat_task/core/di/di.dart' as di;
import 'package:chat_task/core/theme/app_theme.dart';
import 'package:chat_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<Widget> getTestWidget(Widget testWidget) async {
  isUnitTest = true;
  await di.init();
  return MaterialApp(
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
    home: testWidget,
  );
}
