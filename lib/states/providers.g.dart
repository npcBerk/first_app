// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postDetailsHash() => r'38b81c3cd50de7b19b512236282f0d903b4f95c9';

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

/// See also [postDetails].
@ProviderFor(postDetails)
const postDetailsProvider = PostDetailsFamily();

/// See also [postDetails].
class PostDetailsFamily extends Family<AsyncValue<PostModel>> {
  /// See also [postDetails].
  const PostDetailsFamily();

  /// See also [postDetails].
  PostDetailsProvider call(
    int id,
  ) {
    return PostDetailsProvider(
      id,
    );
  }

  @override
  PostDetailsProvider getProviderOverride(
    covariant PostDetailsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'postDetailsProvider';
}

/// See also [postDetails].
class PostDetailsProvider extends AutoDisposeFutureProvider<PostModel> {
  /// See also [postDetails].
  PostDetailsProvider(
    int id,
  ) : this._internal(
          (ref) => postDetails(
            ref as PostDetailsRef,
            id,
          ),
          from: postDetailsProvider,
          name: r'postDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postDetailsHash,
          dependencies: PostDetailsFamily._dependencies,
          allTransitiveDependencies:
              PostDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  PostDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<PostModel> Function(PostDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostDetailsProvider._internal(
        (ref) => create(ref as PostDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PostModel> createElement() {
    return _PostDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostDetailsRef on AutoDisposeFutureProviderRef<PostModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PostDetailsProviderElement
    extends AutoDisposeFutureProviderElement<PostModel> with PostDetailsRef {
  _PostDetailsProviderElement(super.provider);

  @override
  int get id => (origin as PostDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
