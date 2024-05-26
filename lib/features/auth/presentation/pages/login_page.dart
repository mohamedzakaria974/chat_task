import 'package:chat_task/core/constants/assets.dart';
import 'package:chat_task/core/constants/strings.dart';
import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:chat_task/core/utils/validator.dart';
import 'package:chat_task/features/auth/domain/entities/login_entity.dart';
import 'package:chat_task/features/landing/presentation/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../manager/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            top: -85,
            child: Opacity(
              opacity: 0.5,
              child: Container(
                height: size.height * 2 / 3,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    stops: const [0.2, 0.5, 1],
                    colors: [
                      AppColors.darkPurple.withAlpha(24),
                      AppColors.skyBlue.withAlpha(8),
                      Colors.black.withAlpha(8),
                    ],
                    radius: 0.74,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image(
                    image: const AssetImage(Assets.kLogo),
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 16),
                  child: DecoratedBox(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: AppColors.softBlue.withAlpha(23),
                          spreadRadius: 1,
                          blurRadius: 20)
                    ]),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          ?.copyWith(
                            fixedSize: MaterialStatePropertyAll(
                              Size.fromWidth(MediaQuery.sizeOf(context).width),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(AppColors.white),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Strings.kUsage,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.grey30),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SvgPicture.asset(Assets.kGoogle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              Strings.kEmail,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.grey30),
                            ),
                          ),
                          TextFormField(
                            maxLines: 1,
                            validator: Validator.validateEmail,
                            controller: _usernameController,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                Strings.kPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.grey30),
                              ),
                            ),
                            TextFormField(
                              controller: _passwordController,
                              validator: Validator.requiredFieldValidator,
                              maxLines: 1,
                              obscureText: true,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  BitesIcons.openEye,
                                  size: 16,
                                  color: AppColors.purple,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          Strings.kForgotPassword,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.purple,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is AuthLoggedInState) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => LandingScreen(),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    LoginEvent(
                                      loginEntity: LoginEntity(
                                        password: _passwordController.text,
                                        email: _usernameController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style
                                  ?.copyWith(
                                    fixedSize: MaterialStatePropertyAll(
                                      Size.fromWidth(
                                          MediaQuery.sizeOf(context).width),
                                    ),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            AppColors.purple),
                                  ),
                              child: Text(
                                Strings.kLogin,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.kDontHaveAnAccount,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.grey30),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              Strings.kCreateAnAccount,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.purple,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
