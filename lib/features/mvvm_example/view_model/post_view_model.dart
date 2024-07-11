import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/features/mvvm_example/model/post_model.dart';
import 'package:riverpod_example/features/mvvm_example/service/post_service.dart';

part 'post_view_model.g.dart';

/*
  아래와 같이 Provider를 사용하여 ViewModel을 생성할 수 있습니다.
  장점은 간단한 상태를 관리할 수 있고, 상태에 따라 다른 UI를 보여줄 수 있습니다.
  단점은 상태가 하나일 때만 사용할 수 있습니다.
  또한, 상태에 따라 다른 로직을 수행할 수 없습니다.
 */
final postViewModelProvider = Provider((ref) {
  final service = ref.read(postServiceProvider);
  return PostViewModel(service);
});

final fetchPostsProvider =
    FutureProvider.autoDispose<List<PostModel>>((ref) async {
  final viewModel = ref.watch(postViewModelProvider);
  return await viewModel.getPosts() ?? [];
});

class PostViewModel {
  PostServiceImpl postServiceImpl;
  PostViewModel(this.postServiceImpl);

  Future<List<PostModel>?> getPosts() async {
    try {
      final posts = await postServiceImpl.getPosts();
      return posts;
    } on DioException catch (e) {
      print(e.message);
    } catch (e) {
      print(e);
    }
    return null;
  }
}

/*
  아래와 같이 AsyncNotifierProvider를 사용하여 비동기 상태를 관리할 수 있습니다.
  장점은 여러가지 state 상태를 관리할 수 있고, 상태에 따라 다른 UI를 보여줄 수 있습니다.
  또한, 상태에 따라 다른 로직을 수행할 수 있습니다.
  단점은 코드가 복잡해질 수 있습니다.
 */
final asyncPostNotifier =
    AutoDisposeAsyncNotifierProvider<AsyncPostNotifier, List<PostModel>>(
  AsyncPostNotifier.new,
);

class AsyncPostNotifier extends AutoDisposeAsyncNotifier<List<PostModel>> {
  late final PostServiceImpl _postServiceImpl;

  @override
  FutureOr<List<PostModel>> build() {
    _postServiceImpl = ref.read(postServiceProvider);
    return _postServiceImpl.getPosts();
  }
}

/*
  @riverpod 어노테이션을 사용하여 코드를 생성할 수 있습니다.
  자동으로 provider를 생성해줍니다.
 */
@riverpod
class AsyncPostGetNotifier extends _$AsyncPostGetNotifier {
  late final PostServiceImpl _postServiceImpl;

  @override
  FutureOr<List<PostModel>> build() {
    _postServiceImpl = ref.read(postServiceProvider);
    return _postServiceImpl.getPosts();
  }
}
