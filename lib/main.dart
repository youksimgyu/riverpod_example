import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String api = 'https://jsonplaceholder.typicode.com/posts';
  String responseText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                final response = await http.get(Uri.parse(api));
                if (response.statusCode == 200) {
                  setState(() {
                    responseText = response.body;
                  });
                }
              },
              child: const Text('http get'),
            ),
            TextButton(
              onPressed: () async {
                final response = await http.post(
                  Uri.parse(api),
                  headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(
                      {'title': 'foo', 'body': 'bar', 'userId': '1'}),
                );
                if (response.statusCode == 201) {
                  setState(() {
                    responseText = response.body;
                  });
                }
              },
              child: const Text('http post'),
            ),
            TextButton(
              onPressed: () async {
                final response = await http.put(
                  Uri.parse('$api/1'),
                  headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode({
                    'id': '1',
                    'title': 'foo',
                    'body': 'bar',
                    'userId': '1'
                  }),
                );
                if (response.statusCode == 200) {
                  setState(() {
                    responseText = response.body;
                  });
                }
              },
              child: const Text('http put'),
            ),
            TextButton(
              onPressed: () async {
                final response = await http.delete(Uri.parse('$api/1'));
                if (response.statusCode == 200) {
                  setState(() {
                    responseText = response.body;
                  });
                }
              },
              child: const Text('http delete'),
            ),
            const Divider(),
            Expanded(
                child: SingleChildScrollView(
              child: Text(responseText),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
