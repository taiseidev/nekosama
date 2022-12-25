import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/ui/pages/auth/sign_in/sign_in_page.dart';
import 'package:nekosama/ui/pages/top/top_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
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
    ],

    //遷移ページがないなどのエラーが発生した時に、このページに行く
    // errorPageBuilder: (context, state) => MaterialPage(child: ),
  ),
);

/// エラー画面
// class ErrorRoute extends GoRouteData {
//   const ErrorRoute(
//     this.error,
//   );

//   final Exception? error;

//   @override
//   Widget build(BuildContext context) {
//     return ErrorPage(error: error!);
//   }
// }
