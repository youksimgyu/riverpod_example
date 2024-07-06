import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CacheForExtension on AutoDisposeRef<Object?> {
  void cacheFor(Duration duration) {
    final link = keepAlive();
    late Timer timer;
    onCancel(() {
      timer = Timer(duration, () {
        link.close();
      });
    });
    onDispose(() {
      timer.cancel();
    });
    onResume(() {
      timer.cancel();
    });
  }
}
