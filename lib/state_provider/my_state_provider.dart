import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider.autoDispose<int>(
  (ref) => 0,
  name: 'counterStateProvider',
);
