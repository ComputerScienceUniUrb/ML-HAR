// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ar_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDailyRecordsHash() => r'5a44966ec36c9729399e2f8314bec793e9f1ad94';

/// See also [getDailyRecords].
@ProviderFor(getDailyRecords)
final getDailyRecordsProvider =
    AutoDisposeStreamProvider<List<ARData>>.internal(
  getDailyRecords,
  name: r'getDailyRecordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDailyRecordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDailyRecordsRef = AutoDisposeStreamProviderRef<List<ARData>>;
String _$getAggregatedDayHash() => r'5746d6756dc6c26a5a47f80b4abf409a403f43fe';

/// See also [getAggregatedDay].
@ProviderFor(getAggregatedDay)
final getAggregatedDayProvider =
    AutoDisposeStreamProvider<Map<DateTime, List<ARData>>>.internal(
  getAggregatedDay,
  name: r'getAggregatedDayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAggregatedDayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAggregatedDayRef
    = AutoDisposeStreamProviderRef<Map<DateTime, List<ARData>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
