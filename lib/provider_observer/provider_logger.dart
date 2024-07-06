import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // super.didAddProvider(provider, value, container);
    print('''
      {
        "type": "didAddProvider",
        "provider": "$provider",
        "value": "$value",
        "container": "$container"
      }
    ''');
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    // super.didUpdateProvider(provider, previousValue, newValue, container);
    print('''
      {
        "type": "didUpdateProvider",
        "provider": "$provider",
        "previousValue": "$previousValue",
        "newValue": "$newValue",
        "container": "$container"
      }
    ''');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    // super.didDisposeProvider(provider, container);
    print('''
      {
        "type": "didDisposeProvider",
        "provider": "$provider",
        "container": "$container"
      }
    ''');
  }
}
