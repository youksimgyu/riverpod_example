import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/counter_provider.dart';

void main() {
  final container = ProviderContainer();
  final counterClass = container.read(counterProvider);
  print(counterClass.counterValue);
  counterClass.increment();
  print(counterClass.counterValue);

  final counter2Class = container.read(counter2Provider);
  print(counter2Class.counterValue);
  counter2Class.increment();
  print(counter2Class.counterValue);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
