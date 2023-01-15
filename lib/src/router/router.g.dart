// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $topRoute,
      $phoneNumberInputRoute,
      $authCodeInputRoute,
    ];

GoRoute get $topRoute => GoRouteData.$route(
      path: '/',
      factory: $TopRouteExtension._fromState,
    );

extension $TopRouteExtension on TopRoute {
  static TopRoute _fromState(GoRouterState state) => const TopRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $phoneNumberInputRoute => GoRouteData.$route(
      path: '/phoneNumberInput',
      factory: $PhoneNumberInputRouteExtension._fromState,
    );

extension $PhoneNumberInputRouteExtension on PhoneNumberInputRoute {
  static PhoneNumberInputRoute _fromState(GoRouterState state) =>
      const PhoneNumberInputRoute();

  String get location => GoRouteData.$location(
        '/phoneNumberInput',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $authCodeInputRoute => GoRouteData.$route(
      path: '/authCodeInput',
      factory: $AuthCodeInputRouteExtension._fromState,
    );

extension $AuthCodeInputRouteExtension on AuthCodeInputRoute {
  static AuthCodeInputRoute _fromState(GoRouterState state) =>
      const AuthCodeInputRoute();

  String get location => GoRouteData.$location(
        '/authCodeInput',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
