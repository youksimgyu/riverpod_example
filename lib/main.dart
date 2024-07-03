import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/counter_consumer_stful_widget.dart';
import 'package:riverpod_example/provider/counter_consumer_widget.dart';
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CounterWidget(),
              const CounterStatefulWidget(),
              Consumer(
                builder: (context, ref, child) {
                  final counter = ref.read(counterProvider);
                  return ElevatedButton(
                    onPressed: () {
                      counter.decrement();
                    },
                    child: const Text('감소'),
                  );
                },
              ),
            ],
          ),
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
