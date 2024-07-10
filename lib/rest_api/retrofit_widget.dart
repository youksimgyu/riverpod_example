import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_example/retrofit/post_api.dart';

class RetrofitWidget extends StatefulWidget {
  const RetrofitWidget({super.key});

  @override
  State<RetrofitWidget> createState() => _RetrofitWidgetState();
}

class _RetrofitWidgetState extends State<RetrofitWidget> {
  final Dio dio = Dio();
  late PostApi postApi;

  String responseText = '';

  @override
  void initState() {
    super.initState();
    postApi = PostApi(dio);
  }

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
            ElevatedButton(
              onPressed: () async {
                final response = await postApi.getPosts();
                if (response.response.statusCode == 200) {
                  setState(() {
                    responseText = response.data.toString();
                  });
                }
              },
              child: const Text('Retrofit get'),
            ),
            ElevatedButton(
              onPressed: () async {
                final response = await postApi.postPost({
                  'title': 'foo',
                  'body': 'bar',
                  'userId': 1,
                });
                if (response.response.statusCode == 201) {
                  setState(() {
                    responseText = response.data.toString();
                  });
                }
              },
              child: const Text('Retrofit post'),
            ),
            ElevatedButton(
              onPressed: () async {
                final response = await postApi.putPost('1', {
                  'id': 1,
                  'title': 'foo',
                  'body': 'bar',
                  'userId': 1,
                });
                if (response.response.statusCode == 200) {
                  setState(() {
                    responseText = response.data.toString();
                  });
                }
              },
              child: const Text('Retrofit put'),
            ),
            ElevatedButton(
              onPressed: () async {
                final response = await postApi.deletePost('1');
                if (response.response.statusCode == 200) {
                  setState(() {
                    responseText = response.data.toString();
                  });
                }
              },
              child: const Text('Retrofit delete'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(responseText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
