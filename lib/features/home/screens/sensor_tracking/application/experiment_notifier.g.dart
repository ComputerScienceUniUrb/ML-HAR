// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getExperimentByCodeHash() =>
    r'9191b5af278c3ddd7545b84df465972f2c01e009';

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

/// See also [getExperimentByCode].
@ProviderFor(getExperimentByCode)
const getExperimentByCodeProvider = GetExperimentByCodeFamily();

/// See also [getExperimentByCode].
class GetExperimentByCodeFamily extends Family<AsyncValue<Experiment?>> {
  /// See also [getExperimentByCode].
  const GetExperimentByCodeFamily();

  /// See also [getExperimentByCode].
  GetExperimentByCodeProvider call(
    String shortCode,
  ) {
    return GetExperimentByCodeProvider(
      shortCode,
    );
  }

  @override
  GetExperimentByCodeProvider getProviderOverride(
    covariant GetExperimentByCodeProvider provider,
  ) {
    return call(
      provider.shortCode,
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
  String? get name => r'getExperimentByCodeProvider';
}

/// See also [getExperimentByCode].
class GetExperimentByCodeProvider
    extends AutoDisposeFutureProvider<Experiment?> {
  /// See also [getExperimentByCode].
  GetExperimentByCodeProvider(
    String shortCode,
  ) : this._internal(
          (ref) => getExperimentByCode(
            ref as GetExperimentByCodeRef,
            shortCode,
          ),
          from: getExperimentByCodeProvider,
          name: r'getExperimentByCodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getExperimentByCodeHash,
          dependencies: GetExperimentByCodeFamily._dependencies,
          allTransitiveDependencies:
              GetExperimentByCodeFamily._allTransitiveDependencies,
          shortCode: shortCode,
        );

  GetExperimentByCodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shortCode,
  }) : super.internal();

  final String shortCode;

  @override
  Override overrideWith(
    FutureOr<Experiment?> Function(GetExperimentByCodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetExperimentByCodeProvider._internal(
        (ref) => create(ref as GetExperimentByCodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shortCode: shortCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Experiment?> createElement() {
    return _GetExperimentByCodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetExperimentByCodeProvider && other.shortCode == shortCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shortCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetExperimentByCodeRef on AutoDisposeFutureProviderRef<Experiment?> {
  /// The parameter `shortCode` of this provider.
  String get shortCode;
}

class _GetExperimentByCodeProviderElement
    extends AutoDisposeFutureProviderElement<Experiment?>
    with GetExperimentByCodeRef {
  _GetExperimentByCodeProviderElement(super.provider);

  @override
  String get shortCode => (origin as GetExperimentByCodeProvider).shortCode;
}

String _$getExperimentByIdHash() => r'1e23b3aa08794880270805f7e8f25487b9e868dc';

/// See also [getExperimentById].
@ProviderFor(getExperimentById)
const getExperimentByIdProvider = GetExperimentByIdFamily();

/// See also [getExperimentById].
class GetExperimentByIdFamily extends Family<AsyncValue<Experiment?>> {
  /// See also [getExperimentById].
  const GetExperimentByIdFamily();

  /// See also [getExperimentById].
  GetExperimentByIdProvider call(
    String experimentId,
  ) {
    return GetExperimentByIdProvider(
      experimentId,
    );
  }

  @override
  GetExperimentByIdProvider getProviderOverride(
    covariant GetExperimentByIdProvider provider,
  ) {
    return call(
      provider.experimentId,
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
  String? get name => r'getExperimentByIdProvider';
}

/// See also [getExperimentById].
class GetExperimentByIdProvider extends AutoDisposeFutureProvider<Experiment?> {
  /// See also [getExperimentById].
  GetExperimentByIdProvider(
    String experimentId,
  ) : this._internal(
          (ref) => getExperimentById(
            ref as GetExperimentByIdRef,
            experimentId,
          ),
          from: getExperimentByIdProvider,
          name: r'getExperimentByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getExperimentByIdHash,
          dependencies: GetExperimentByIdFamily._dependencies,
          allTransitiveDependencies:
              GetExperimentByIdFamily._allTransitiveDependencies,
          experimentId: experimentId,
        );

  GetExperimentByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.experimentId,
  }) : super.internal();

  final String experimentId;

  @override
  Override overrideWith(
    FutureOr<Experiment?> Function(GetExperimentByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetExperimentByIdProvider._internal(
        (ref) => create(ref as GetExperimentByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        experimentId: experimentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Experiment?> createElement() {
    return _GetExperimentByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetExperimentByIdProvider &&
        other.experimentId == experimentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, experimentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetExperimentByIdRef on AutoDisposeFutureProviderRef<Experiment?> {
  /// The parameter `experimentId` of this provider.
  String get experimentId;
}

class _GetExperimentByIdProviderElement
    extends AutoDisposeFutureProviderElement<Experiment?>
    with GetExperimentByIdRef {
  _GetExperimentByIdProviderElement(super.provider);

  @override
  String get experimentId => (origin as GetExperimentByIdProvider).experimentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
