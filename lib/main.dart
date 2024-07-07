import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/riverpod_gen/future_gen_proivder.dart';

void main() {
  runApp(const ProviderScope(
    observers: [
      // ProviderLogger(),
    ],
    child: MainApp(),
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

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(newCounterProvider(10, 20));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            counter.when(
              data: (data) => Text('Data: $data'),
              error: (error, stack) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator.adaptive(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(asyncCounterNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
