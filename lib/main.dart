import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'go_router/go_router_builder/basic_builder.dart';

void main() async {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(routes: $appRoutes),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.push('/login');
                LoginRoute('').push(context);
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                // context.push('user');
                UserRoute('100').push(context);
              },
              child: const Text('User'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: const Center(
        child: Text('Login Screen'),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: Center(
        child: Text('User Screen $userId'),
      ),
    );
  }
}
