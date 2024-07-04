import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/stream_provider/simple_stream_provider.dart';

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
    return Scaffold(
      // body: MyStreamProviderWidget(),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            ref.listen(simpleStreamProvider, (previous, next) {
              print('previous: $previous, next: $next');
            });
            return StreamBuilder(
              stream: ref.watch(simpleStreamProvider.future).asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Data: ${snapshot.data}');
                }
                return const CircularProgressIndicator.adaptive();
              },
            );
          },
        ),
      ),
    );
  }
}
