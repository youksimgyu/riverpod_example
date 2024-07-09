import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_example/shell_router/basic_shell_router.dart';

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
      routerConfig: basicShellRouter,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: widget.child
      /*Center(
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
      )*/
      ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          if (value == 0) {
            context.push('/login');
            // GoRouter.of(context).push('/login');
          } else {
            context.push('/user');
            // GoRouter.of(context).push('/user');
          }
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
      body: Center(
        child: Text('User Screen $userId'),
      ),
    );
  }
}
