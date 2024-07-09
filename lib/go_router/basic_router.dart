import 'package:go_router/go_router.dart';
import 'package:riverpod_example/main.dart';

final routerBasic = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'user',
          builder: (context, state) => const UserScreen(userId: '1'),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
