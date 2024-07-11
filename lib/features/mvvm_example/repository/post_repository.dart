import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/features/mvvm_example/model/post_model.dart';
import 'package:riverpod_example/features/mvvm_example/service/post_service.dart';

/*
  Service -> Repository -> ViewModel -> View
  위와 같이 구조를 나누어서 코드를 작성할 수 있습니다.
  다만, 코드가 복잡해질 수 있습니다.

  Service -> ViewModel -> View
  위와 같이 구조를 나누어서 코드를 작성할 수 있습니다.
  코드가 간단해질 수 있습니다.
 */
final postRepository = Provider((ref) {
  final service = ref.read(postServiceProvider);
  return PostRepositoryImpl(service);
});

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}

class PostRepositoryImpl implements PostRepository {
  PostServiceImpl postServiceImpl;
  PostRepositoryImpl(this.postServiceImpl);

  @override
  Future<List<PostModel>> getPosts() async {
    return await postServiceImpl.getPosts();
  }
}
