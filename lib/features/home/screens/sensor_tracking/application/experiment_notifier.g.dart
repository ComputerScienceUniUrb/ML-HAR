// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getExperimentByCodeHash() =>
    r'1d1c227e7595fa6dd76ae0bb5334291777e3fdbc';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
