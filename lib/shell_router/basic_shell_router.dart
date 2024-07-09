import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_example/main.dart';

GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> _shellNavKey = GlobalKey<NavigatorState>();

final basicShellRouter = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavKey,
      routes: [
        GoRoute(
            path: '/login', builder: (context, state) => const LoginScreen()),
        GoRoute(
            path: '/user',
            builder: (context, state) => const UserScreen(userId: '1')),
      ],
      builder: (context, state, child) {
        return HomeScreen(child: child);
      },
    ),
  ],
);
