import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String jsonUrl = 'https://jsonplaceholder.typicode.com/users';

void main() async {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Hello World!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await http.get(Uri.parse(jsonUrl));
          if (response.statusCode == 200) {
            print(response.body);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
