import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/state_notifier_provider/my_state_notifier_provider.dart';

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
        body: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(counterStateNotifierProvider);
            return Center(
              child: Text(counter.toString()),
            );
          },
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(
              onPressed: () {
                ref.read(counterStateNotifierProvider.notifier).increment();
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
