import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'future_provider/simple_future_provider.dart';

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
    return const Scaffold(
      body: MyFutureProviderWidget(),
    );
  }
}

class MyFutureProviderWidget extends ConsumerWidget {
  const MyFutureProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intValue = ref.watch(simpleFutureProvider);
    return Center(
      child: intValue.when(
        data: (data) => Text('Data: $data'),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
