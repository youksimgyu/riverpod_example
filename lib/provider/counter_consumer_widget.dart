import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_provider.dart';

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

class CounterStatefulWidget extends ConsumerStatefulWidget {
  const CounterStatefulWidget({super.key});

  @override
  ConsumerState<CounterStatefulWidget> createState() =>
      _CounterStatefulWidgetState();
}

class _CounterStatefulWidgetState extends ConsumerState<CounterStatefulWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ref.read(counterProvider).increment();
        setState(() {});
      },
      child: Text('증가 시키기 ${ref.read(counterProvider).counterValue}'),
    );
  }
}
