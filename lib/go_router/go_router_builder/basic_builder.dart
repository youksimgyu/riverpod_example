import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'basic_builder.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<UserRoute>(path: 'user/:userId'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
    // return const HomeScreen();
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  LoginRoute(this.from);

  final String? from;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
    // return const LoginScreen();
  }
}

class UserRoute extends GoRouteData {
  UserRoute(this.userId);

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
    // return UserScreen(userId: state.pathParameters['userId']!);
  }
}
