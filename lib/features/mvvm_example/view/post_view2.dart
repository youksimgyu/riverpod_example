import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/mvvm_example/view_model/post_view_model.dart';

class PostView2 extends ConsumerWidget {
  const PostView2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(fetchPostsProvider);
    // final posts = ref.watch(asyncPostNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts View'),
      ),
      body: posts.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('No data'));
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].id!.toString()),
                subtitle: Text(data[index].title!),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
