import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final tmpProvider = StateProvider.family<int, int>((ref, arg) => arg + 0);

final idStateProvider = StateProvider<int>((ref) => 1);

final postFutureProviderFamily = FutureProvider.family(
  (ref, id) async {
    final id = ref.watch(idStateProvider);
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (response.statusCode == 200) {
      return response.body;
    }
  },
);

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
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final id = ref.watch(idStateProvider);
            final post = ref.watch(postFutureProviderFamily(id));
            return post.when(
              data: (data) => Text(data.toString()),
              loading: () => const CircularProgressIndicator.adaptive(),
              error: (error, stackTrace) => Text('Error: $error'),
            );
          },
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () =>
                ref.read(idStateProvider.notifier).update((state) => state + 1),
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
