import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/src/common_widgets/top_page.dart';
import 'package:nekosama/src/features/authentication/presentation/sign_in/auth_code_input_page.dart';
import 'package:nekosama/src/features/authentication/presentation/sign_in/sign_in_page.dart';
import 'package:nekosama/src/router/not_found_page.dart';
import 'package:nekosama/src/utils/global_key.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    navigatorKey: ref.watch(navigatorKeyProvider),
    routes: [
      GoRoute(
        name: 'top',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const TopPage();
        },
      ),
      GoRoute(
        name: 'signIn',
        path: '/signIn',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        name: 'authCodeInput',
        path: '/authCodeInput',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthCodeInputPage();
        },
      ),
    ],
    errorBuilder: (context, state) => NotFoundPage(error: state.error!),
  ),
);
