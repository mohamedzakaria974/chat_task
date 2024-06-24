import 'package:chat_task/core/constants/assets.dart';
import 'package:chat_task/core/constants/strings.dart';
import 'package:chat_task/core/di/di.dart' as di;
import 'package:chat_task/features/auth/presentation/manager/auth_bloc.dart';
import 'package:chat_task/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/utils/test_widget_util.dart';

void main() {
  testWidgets(
    'LoginPage must contain',
    (tester) async {
      await tester.pumpWidget(await getTestWidget(BlocProvider(
          create: (_) => di.locator<AuthBloc>()..add(CheckLoggingInEvent()),
          child: const LoginPage())));

      final loginPageFinder = find.byType(LoginPage);
      expect(loginPageFinder, findsOneWidget);
      final logoFinder = find.byType(Image);
      expect(logoFinder, findsOneWidget);
      Image logoImgWidget = logoFinder.evaluate().first.widget as Image;
      expect((logoImgWidget.image as AssetImage).assetName, Assets.kLogo);

      final usingFinder = find.text(Strings.kUsage);
      expect(usingFinder, findsOneWidget);
      final googleIconFinder = find.byType(SvgPicture);
      expect(googleIconFinder, findsOneWidget);
      SvgPicture googleSvgImage =
          googleIconFinder.evaluate().first.widget as SvgPicture;
      expect((googleSvgImage.bytesLoader as SvgAssetLoader).assetName,
          Assets.kGoogle);
      await tester.tap(googleIconFinder);
      await tester.pumpAndSettle();
      expect(loginPageFinder, findsOneWidget);
      final emailTextFinder = find.text(Strings.kEmail);
      expect(emailTextFinder, findsOneWidget);
      final passwordTextFinder = find.text(Strings.kPassword);
      expect(passwordTextFinder, findsOneWidget);
      final textInputFields = find.byType(TextFormField);
      expect(textInputFields, findsExactly(2));

      final forgotPasswordTextFinder = find.text(Strings.kForgotPassword);
      expect(forgotPasswordTextFinder, findsOneWidget);

      final loginBtnFinder = find.text(Strings.kLogin);
      expect(loginBtnFinder, findsOneWidget);

      final dontHaveAnAccountFinder = find.text(Strings.kDontHaveAnAccount);
      expect(dontHaveAnAccountFinder, findsOneWidget);

      final createAnAccountFinder = find.text(Strings.kCreateAnAccount);
      expect(createAnAccountFinder, findsOneWidget);
    },
  );
}
