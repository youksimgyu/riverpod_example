import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_gen_proivder.g.dart';

@riverpod
Future<int> newCounter(NewCounterRef ref, int a, int b) async {
  return 10;
}

// autoDispose 안넣기
// 기본적으로 들어감
@Riverpod(keepAlive: true)
@riverpod
class NewClassCounter extends _$NewClassCounter {
  @override
  Stream<int> build() async* {
    yield 10;
  }
}
