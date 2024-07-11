import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/mvvm_example/view_model/post_view_model.dart';

/*
  간단한 view model을 사용하여 데이터를 가져오는 예제입니다.
  FutureProvider를 사용하여 데이터를 가져옵니다.
  FutureBuilder를 사용하여 데이터를 화면에 표시합니다.
 */
class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts View'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final post = ref.watch(postViewModelProvider);
          return FutureBuilder(
              future: post.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final value = snapshot.data ?? [];
                  if (value.isEmpty) {
                    return const Center(child: Text('No data'));
                  }
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value[index].id!.toString()),
                        subtitle: Text(value[index].title!),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              });
        },
      ),
    );
  }
}
