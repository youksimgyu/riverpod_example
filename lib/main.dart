import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/state_provider/my_state_provider.dart';

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
            final counter = ref.watch(counterStateProvider);
            return Center(
              child: Text(counter.toString()),
            );
          },
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(
              onPressed: () {
                ref
                    .read(counterStateProvider.notifier)
                    .update((state) => state + 1);
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
