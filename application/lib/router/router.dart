import 'package:go_router/go_router.dart';
import 'package:nekosama/main.dart';

class Routers {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(),
      ),
    ],
  );
}
