import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'change_notifier_provider/my_change_notifier_provider.dart';

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
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final count = ref.watch(counterChangeNotifier).counterValue;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('counter : $count'),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(counterChangeNotifier.notifier).increment(),
                  child: const Text('증가'),
                ),
                ElevatedButton(
                  onPressed: () => ref.read(counterChangeNotifier).decrement(),
                  child: const Text('감소'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
