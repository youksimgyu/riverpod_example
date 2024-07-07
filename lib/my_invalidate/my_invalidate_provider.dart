import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_invalidate_provider.g.dart';

final numberStateProvider = StateProvider<int>((ref) => 100);

@riverpod
class NumberNotifier extends _$NumberNotifier {
  @override
  int build() {
    return 1000;
  }

  void increment() {
    state += 1;
  }
}
