import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleFutureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return 0;
});
