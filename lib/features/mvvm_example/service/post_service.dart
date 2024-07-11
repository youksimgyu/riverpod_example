import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/features/mvvm_example/model/post_model.dart';
import 'package:riverpod_example/main.dart';

final postServiceProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return PostServiceImpl(dio);
});

final dioProvider = Provider((ref) {
  return Dio();
});

abstract class PostService {
  Future<List<PostModel>> getPosts();
}

class PostServiceImpl implements PostService {
  Dio dio;
  PostServiceImpl(this.dio);

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await dio.get(api);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
      return posts;
    } else {
      return [];
    }
  }
}
