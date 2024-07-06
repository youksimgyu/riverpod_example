import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider_observer/provider_logger.dart';
import 'package:riverpod_example/state_provider/my_state_provider.dart';

void main() {
  runApp(ProviderScope(
    observers: [
      ProviderLogger(),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scope & Lifecycles'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CounterWidget(),
              const SizedBox(height: 20),
              ProviderScope(
                overrides: [
                  counterStateProvider,
                ],
                child: const CounterWidget(),
              ),
              const SizedBox(height: 20),
              ProviderScope(
                overrides: [
                  counterStateProvider.overrideWith((ref) => 10),
                ],
                child: const CounterWidget(),
              ),
            ],
          ),
        ));
  }
}

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterStateProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Counter: $count'),
        ElevatedButton(
          onPressed: () {
            ref
                .read(counterStateProvider.notifier)
                .update((state) => state + 1);
          },
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
