// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_gen_proivder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newCounterHash() => r'cd25be3d594ca9a6cb6232c9621980cf3a8936fc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [newCounter].
@ProviderFor(newCounter)
const newCounterProvider = NewCounterFamily();

/// See also [newCounter].
class NewCounterFamily extends Family<AsyncValue<int>> {
  /// See also [newCounter].
  const NewCounterFamily();

  /// See also [newCounter].
  NewCounterProvider call(
    int a,
    int b,
  ) {
    return NewCounterProvider(
      a,
      b,
    );
  }

  @override
  NewCounterProvider getProviderOverride(
    covariant NewCounterProvider provider,
  ) {
    return call(
      provider.a,
      provider.b,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'newCounterProvider';
}

/// See also [newCounter].
class NewCounterProvider extends AutoDisposeFutureProvider<int> {
  /// See also [newCounter].
  NewCounterProvider(
    int a,
    int b,
  ) : this._internal(
          (ref) => newCounter(
            ref as NewCounterRef,
            a,
            b,
          ),
          from: newCounterProvider,
          name: r'newCounterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newCounterHash,
          dependencies: NewCounterFamily._dependencies,
          allTransitiveDependencies:
              NewCounterFamily._allTransitiveDependencies,
          a: a,
          b: b,
        );

  NewCounterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.a,
    required this.b,
  }) : super.internal();

  final int a;
  final int b;

  @override
  Override overrideWith(
    FutureOr<int> Function(NewCounterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewCounterProvider._internal(
        (ref) => create(ref as NewCounterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        a: a,
        b: b,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _NewCounterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewCounterProvider && other.a == a && other.b == b;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, a.hashCode);
    hash = _SystemHash.combine(hash, b.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewCounterRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `a` of this provider.
  int get a;

  /// The parameter `b` of this provider.
  int get b;
}

class _NewCounterProviderElement extends AutoDisposeFutureProviderElement<int>
    with NewCounterRef {
  _NewCounterProviderElement(super.provider);

  @override
  int get a => (origin as NewCounterProvider).a;
  @override
  int get b => (origin as NewCounterProvider).b;
}

String _$newClassCounterHash() => r'724cb25eaf0e9cc98e5a7c9ad122ed2275c47d9b';

/// See also [NewClassCounter].
@ProviderFor(NewClassCounter)
final newClassCounterProvider =
    StreamNotifierProvider<NewClassCounter, int>.internal(
  NewClassCounter.new,
  name: r'newClassCounterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newClassCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewClassCounter = StreamNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
