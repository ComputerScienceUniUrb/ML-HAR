// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSessionsByIdHash() => r'094e7faf936ee0f202744b0a6c19e3dbf114b88a';

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

/// See also [getSessionsById].
@ProviderFor(getSessionsById)
const getSessionsByIdProvider = GetSessionsByIdFamily();

/// See also [getSessionsById].
class GetSessionsByIdFamily extends Family<AsyncValue<ActivitySession>> {
  /// See also [getSessionsById].
  const GetSessionsByIdFamily();

  /// See also [getSessionsById].
  GetSessionsByIdProvider call(
    String sessionId,
  ) {
    return GetSessionsByIdProvider(
      sessionId,
    );
  }

  @override
  GetSessionsByIdProvider getProviderOverride(
    covariant GetSessionsByIdProvider provider,
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
  String? get name => r'getSessionsByIdProvider';
}

/// See also [getSessionsById].
class GetSessionsByIdProvider
    extends AutoDisposeStreamProvider<ActivitySession> {
  /// See also [getSessionsById].
  GetSessionsByIdProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getSessionsById(
            ref as GetSessionsByIdRef,
            sessionId,
          ),
          from: getSessionsByIdProvider,
          name: r'getSessionsByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSessionsByIdHash,
          dependencies: GetSessionsByIdFamily._dependencies,
          allTransitiveDependencies:
              GetSessionsByIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetSessionsByIdProvider._internal(
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
  Override overrideWith(
    Stream<ActivitySession> Function(GetSessionsByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSessionsByIdProvider._internal(
        (ref) => create(ref as GetSessionsByIdRef),
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
  AutoDisposeStreamProviderElement<ActivitySession> createElement() {
    return _GetSessionsByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSessionsByIdProvider && other.sessionId == sessionId;
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
mixin GetSessionsByIdRef on AutoDisposeStreamProviderRef<ActivitySession> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetSessionsByIdProviderElement
    extends AutoDisposeStreamProviderElement<ActivitySession>
    with GetSessionsByIdRef {
  _GetSessionsByIdProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetSessionsByIdProvider).sessionId;
}

String _$getSessionPlayerHash() => r'a9cca80db7dfa14f2ce72903637667a5d4e5d407';

/// See also [getSessionPlayer].
@ProviderFor(getSessionPlayer)
const getSessionPlayerProvider = GetSessionPlayerFamily();

/// See also [getSessionPlayer].
class GetSessionPlayerFamily extends Family<AsyncValue<Player?>> {
  /// See also [getSessionPlayer].
  const GetSessionPlayerFamily();

  /// See also [getSessionPlayer].
  GetSessionPlayerProvider call(
    String sessionId,
  ) {
    return GetSessionPlayerProvider(
      sessionId,
    );
  }

  @override
  GetSessionPlayerProvider getProviderOverride(
    covariant GetSessionPlayerProvider provider,
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
  String? get name => r'getSessionPlayerProvider';
}

/// See also [getSessionPlayer].
class GetSessionPlayerProvider extends AutoDisposeStreamProvider<Player?> {
  /// See also [getSessionPlayer].
  GetSessionPlayerProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getSessionPlayer(
            ref as GetSessionPlayerRef,
            sessionId,
          ),
          from: getSessionPlayerProvider,
          name: r'getSessionPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSessionPlayerHash,
          dependencies: GetSessionPlayerFamily._dependencies,
          allTransitiveDependencies:
              GetSessionPlayerFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetSessionPlayerProvider._internal(
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
  Override overrideWith(
    Stream<Player?> Function(GetSessionPlayerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSessionPlayerProvider._internal(
        (ref) => create(ref as GetSessionPlayerRef),
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
  AutoDisposeStreamProviderElement<Player?> createElement() {
    return _GetSessionPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSessionPlayerProvider && other.sessionId == sessionId;
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
mixin GetSessionPlayerRef on AutoDisposeStreamProviderRef<Player?> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetSessionPlayerProviderElement
    extends AutoDisposeStreamProviderElement<Player?> with GetSessionPlayerRef {
  _GetSessionPlayerProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetSessionPlayerProvider).sessionId;
}

String _$getTestsBySessionIdHash() =>
    r'67643afd4078bb048220c84e2871a3b0f578f489';

/// See also [getTestsBySessionId].
@ProviderFor(getTestsBySessionId)
const getTestsBySessionIdProvider = GetTestsBySessionIdFamily();

/// See also [getTestsBySessionId].
class GetTestsBySessionIdFamily
    extends Family<AsyncValue<List<SensorTrackData>>> {
  /// See also [getTestsBySessionId].
  const GetTestsBySessionIdFamily();

  /// See also [getTestsBySessionId].
  GetTestsBySessionIdProvider call(
    String sessionId,
  ) {
    return GetTestsBySessionIdProvider(
      sessionId,
    );
  }

  @override
  GetTestsBySessionIdProvider getProviderOverride(
    covariant GetTestsBySessionIdProvider provider,
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
  String? get name => r'getTestsBySessionIdProvider';
}

/// See also [getTestsBySessionId].
class GetTestsBySessionIdProvider
    extends AutoDisposeStreamProvider<List<SensorTrackData>> {
  /// See also [getTestsBySessionId].
  GetTestsBySessionIdProvider(
    String sessionId,
  ) : this._internal(
          (ref) => getTestsBySessionId(
            ref as GetTestsBySessionIdRef,
            sessionId,
          ),
          from: getTestsBySessionIdProvider,
          name: r'getTestsBySessionIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTestsBySessionIdHash,
          dependencies: GetTestsBySessionIdFamily._dependencies,
          allTransitiveDependencies:
              GetTestsBySessionIdFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  GetTestsBySessionIdProvider._internal(
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
  Override overrideWith(
    Stream<List<SensorTrackData>> Function(GetTestsBySessionIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTestsBySessionIdProvider._internal(
        (ref) => create(ref as GetTestsBySessionIdRef),
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
  AutoDisposeStreamProviderElement<List<SensorTrackData>> createElement() {
    return _GetTestsBySessionIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTestsBySessionIdProvider && other.sessionId == sessionId;
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
mixin GetTestsBySessionIdRef
    on AutoDisposeStreamProviderRef<List<SensorTrackData>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _GetTestsBySessionIdProviderElement
    extends AutoDisposeStreamProviderElement<List<SensorTrackData>>
    with GetTestsBySessionIdRef {
  _GetTestsBySessionIdProviderElement(super.provider);

  @override
  String get sessionId => (origin as GetTestsBySessionIdProvider).sessionId;
}

String _$groupedSessionsHash() => r'2b3e725b433301fbef130115b4d1821136bd8878';

/// See also [groupedSessions].
@ProviderFor(groupedSessions)
final groupedSessionsProvider =
    AutoDisposeStreamProvider<List<GroupedSession>>.internal(
  groupedSessions,
  name: r'groupedSessionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupedSessionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GroupedSessionsRef = AutoDisposeStreamProviderRef<List<GroupedSession>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
