import 'package:flutter/material.dart';
import 'package:riverpod_example/rest_api/http_widget.dart';

const api = 'https://jsonplaceholder.typicode.com/posts';

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
      home: HttpWidget(),
    );
  }
}
