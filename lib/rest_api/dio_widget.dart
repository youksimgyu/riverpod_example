import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_example/main.dart';

class DioWidget extends StatefulWidget {
  const DioWidget({super.key});

  @override
  State<DioWidget> createState() => _DioWidgetState();
}

class _DioWidgetState extends State<DioWidget> {
  String responseText = '';
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ),
  );
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
                final response = await dio.get(api);
                if (response.statusCode == 200) {
                  setState(() {
                    responseText = response.data.toString();
                  });
                }
              },
              child: const Text('http get'),
            ),
            TextButton(
              onPressed: () async {
                final response = await dio.post(
                  api,
                  data: {'title': 'foo', 'body': 'bar', 'userId': '1'},
                );
                if (response.statusCode == 201) {
                  setState(() {
                    responseText = response.data.toString();
                  });
                }
              },
              child: const Text('http post'),
            ),
            TextButton(
              onPressed: () async {
                final response = await dio.putUri(
                  Uri.parse('$api/1'),
                  data: {'title': 'foo', 'body': 'bar', 'userId': '1'},
                );
                if (response.statusCode == 200) {
                  setState(() {
                    responseText = response.data.toString();
                  });
                }
              },
              child: const Text('http put'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  final response = await dio.delete(
                    '$api/asdfasdfasdf/123tadsgfsdf',
                  );
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    setState(() {
                      responseText = response.data.toString();
                    });
                  }
                } on DioException catch (e) {
                  setState(() {
                    responseText = e.message ?? 'Error';
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
