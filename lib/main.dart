import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/state_provider/my_state_provider.dart';

final lifeCycleProvider = StateProvider.autoDispose<int>((ref) {
  // 1번 방법
  // Timer? timer;
  // final link = ref.keepAlive();

  // 2번 방법
  ref.cacheFor(const Duration(seconds: 5));

  ref.onAddListener(() {
    print('lifeCycleProvider: onAddListener');
  });

  ref.onRemoveListener(() {
    print('lifeCycleProvider: onRemoveListener');
  });

  ref.onResume(() {
    print('lifeCycleProvider: onResume');
    // timer?.cancel();
  });

  ref.onCancel(() {
    print('lifeCycleProvider: onCancel');
    // timer = Timer(const Duration(seconds: 5), () {
    //   link.close();
    // });
  });

  ref.onDispose(() {
    print('lifeCycleProvider: onDispose');
    // timer?.cancel();
  });

  return 0;
});

extension CacheForExtension on AutoDisposeRef<Object?> {
  void cacheFor(Duration duration) {
    final link = keepAlive();
    late Timer timer;
    onCancel(() {
      timer = Timer(duration, () {
        link.close();
      });
    });
    onDispose(() {
      timer.cancel();
    });
    onResume(() {
      timer.cancel();
    });
  }
}

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
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                child: const Text('Go to Second Page'),
              ),
              const Divider(),
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

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(lifeCycleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $count'),
            ElevatedButton(
              onPressed: () => ref
                  .read(lifeCycleProvider.notifier)
                  .update((state) => state + 1),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
