import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nekosama/src/common_widgets/top_page.dart';
import 'package:nekosama/src/features/authentication/presentation/sign_in/auth_code_input_page.dart';
import 'package:nekosama/src/features/authentication/presentation/sign_in/phone_number_input_page.dart';
import 'package:nekosama/src/router/not_found_page.dart';

part 'router.g.dart';

// ShellRoute用のNavigator
final _shellNavigatorKeyProvider = Provider(
  (_) => GlobalKey<NavigatorState>(),
);

/// ダイアログ表示用のGlobalKey
final navigatorKeyProvider = Provider(
  (_) => GlobalKey<NavigatorState>(),
);

@TypedGoRoute<TopRoute>(
  path: '/',
)
class TopRoute extends GoRouteData {
  const TopRoute();

  @override
  Widget build(BuildContext context) => const TopPage();
}

@TypedGoRoute<PhoneNumberInputRoute>(
  path: '/phoneNumberInput',
)
class PhoneNumberInputRoute extends GoRouteData {
  const PhoneNumberInputRoute();

  @override
  Widget build(BuildContext context) => const PhoneNumberInputPage();
}

@TypedGoRoute<AuthCodeInputRoute>(
  path: '/authCodeInput',
)
class AuthCodeInputRoute extends GoRouteData {
  const AuthCodeInputRoute();

  @override
  Widget build(BuildContext context) => const AuthCodeInputPage();
}

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: ref.watch(navigatorKeyProvider),
    routes: $appRoutes,
    // routes: [
    //   GoRoute(
    //     name: 'nameEmailInput',
    //     path: '/nameEmailInput',
    //     builder: (BuildContext context, GoRouterState state) {
    //       return const NameEmailInputPage();
    //     },
    //   ),
    //   ShellRoute(
    //     navigatorKey: ref.watch(_shellNavigatorKeyProvider),
    //     builder: (context, state, child) {
    //       return ScaffoldWithBottomNavBar(child: child);
    //     },
    //     routes: [
    //       GoRoute(
    //         path: '/home',
    //         pageBuilder: (context, state) => NoTransitionPage<void>(
    //           key: state.pageKey,
    //           child: const HomePage(),
    //         ),
    //         routes: [
    //           GoRoute(
    //             path: 'detail',
    //             builder: (BuildContext context, GoRouterState state) {
    //               return const DetailPage();
    //             },
    //           ),
    //         ],
    //       ),
    //       GoRoute(
    //         path: '/search',
    //         pageBuilder: (context, state) => NoTransitionPage<void>(
    //           key: state.pageKey,
    //           child: const SearchPage(),
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/post',
    //         pageBuilder: (context, state) => NoTransitionPage<void>(
    //           key: state.pageKey,
    //           child: const PostPage(),
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/community',
    //         pageBuilder: (context, state) => NoTransitionPage<void>(
    //           key: state.pageKey,
    //           child: const CommunityPage(),
    //         ),
    //       ),
    //       GoRoute(
    //         path: '/profile',
    //         pageBuilder: (context, state) => NoTransitionPage<void>(
    //           key: state.pageKey,
    //           child: const ProfilePage(),
    //         ),
    //       ),
    //     ],
    //   ),
    // ],
    errorBuilder: (context, state) => NotFoundPage(error: state.error!),
  ),
);
