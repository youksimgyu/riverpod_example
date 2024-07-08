import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_example/model/freezed_user_model.dart';

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
            List<dynamic> users = jsonDecode(response.body);
            for (var element in users) {
              final jsonData = element as Map<String, dynamic>;
              final user = FreezedUserModel.fromJson(jsonData);
              print(user.toString());
            }
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
