import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

final counterSimpleProvider = StateProvider<int>((ref) => 1);

final class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    final init = ref.read(counterSimpleProvider);
    return 0 + init;
  }

  void increment() {
    state++;
  }
}

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, int>(
        (ref) => CounterStateNotifier());

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  void increment() {
    state++;
  }
}
