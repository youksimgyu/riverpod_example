import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/future_provider/simple_future_provider.dart';

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
