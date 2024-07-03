import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/counter_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: CounterWidget(),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            final counter = ref.read(counterProvider);
            return FloatingActionButton(
              onPressed: () {
                counter.increment();
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.read(counterProvider);
    return ElevatedButton(
      onPressed: () => counter.increment(),
      child: const Text('증가 시키기'),
    );
  }
}
