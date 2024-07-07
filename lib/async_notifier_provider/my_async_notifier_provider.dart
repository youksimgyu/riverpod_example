import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncCounterNotifierProvider =
    AsyncNotifierProvider<AsyncCounterNotifier, int>(AsyncCounterNotifier.new);

final class AsyncCounterNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    Dio dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    print(response.data);

    final users = response.data as List;

    return users.length;
  }
}
