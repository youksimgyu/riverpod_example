import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const jsonUrl = 'https://jsonplaceholder.typicode.com/posts';

final postFutureProvider = FutureProvider.autoDispose<String?>((ref) async {
  ref.onCancel(() {
    print('Cancelled');
  });

  ref.onDispose(() {
    print('Disposed');
  });

  final response = await http.get(Uri.parse("$jsonUrl/1"));
  if (response.statusCode == 200) {
    return response.body;
  }
  return null;
});

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
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SecondPage(),
            ),
          );
        },
        child: const Text('다음 페이지'),
      )),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final post = ref.watch(postFutureProvider);
            return post.when(
              data: (data) => Text(data.toString()),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
