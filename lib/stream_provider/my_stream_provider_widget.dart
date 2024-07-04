import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/stream_provider/simple_stream_provider.dart';

class MyStreamProviderWidget extends ConsumerWidget {
  const MyStreamProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(simpleStreamProvider);
    return Center(
      child: switch (counter) {
        AsyncData(:final value) => Text('Data: $value'),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const CircularProgressIndicator.adaptive(),
      },
    );
  }
}
