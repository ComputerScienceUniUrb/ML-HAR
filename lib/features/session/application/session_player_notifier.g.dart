// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_player_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionPlayerNotifierHash() =>
    r'c18adf04d5ea2633aa05cff172d1f6528b8cd1f9';

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

abstract class _$SessionPlayerNotifier
    extends BuildlessAutoDisposeNotifier<SessionPlayerState> {
  late final String sessionId;

  SessionPlayerState build(
    String sessionId,
  );
}

/// See also [SessionPlayerNotifier].
@ProviderFor(SessionPlayerNotifier)
const sessionPlayerNotifierProvider = SessionPlayerNotifierFamily();

/// See also [SessionPlayerNotifier].
class SessionPlayerNotifierFamily extends Family<SessionPlayerState> {
  /// See also [SessionPlayerNotifier].
  const SessionPlayerNotifierFamily();

  /// See also [SessionPlayerNotifier].
  SessionPlayerNotifierProvider call(
    String sessionId,
  ) {
    return SessionPlayerNotifierProvider(
      sessionId,
    );
  }

  @override
  SessionPlayerNotifierProvider getProviderOverride(
    covariant SessionPlayerNotifierProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'sessionPlayerNotifierProvider';
}

/// See also [SessionPlayerNotifier].
class SessionPlayerNotifierProvider extends AutoDisposeNotifierProviderImpl<
    SessionPlayerNotifier, SessionPlayerState> {
  /// See also [SessionPlayerNotifier].
  SessionPlayerNotifierProvider(
    String sessionId,
  ) : this._internal(
          () => SessionPlayerNotifier()..sessionId = sessionId,
          from: sessionPlayerNotifierProvider,
          name: r'sessionPlayerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sessionPlayerNotifierHash,
          dependencies: SessionPlayerNotifierFamily._dependencies,
          allTransitiveDependencies:
              SessionPlayerNotifierFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  SessionPlayerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  SessionPlayerState runNotifierBuild(
    covariant SessionPlayerNotifier notifier,
  ) {
    return notifier.build(
      sessionId,
    );
  }

  @override
  Override overrideWith(SessionPlayerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SessionPlayerNotifierProvider._internal(
        () => create()..sessionId = sessionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SessionPlayerNotifier, SessionPlayerState>
      createElement() {
    return _SessionPlayerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionPlayerNotifierProvider &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SessionPlayerNotifierRef
    on AutoDisposeNotifierProviderRef<SessionPlayerState> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SessionPlayerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SessionPlayerNotifier,
        SessionPlayerState> with SessionPlayerNotifierRef {
  _SessionPlayerNotifierProviderElement(super.provider);

  @override
  String get sessionId => (origin as SessionPlayerNotifierProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
