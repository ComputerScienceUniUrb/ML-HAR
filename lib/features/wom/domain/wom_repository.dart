import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/features/wom/data/wom_local_data_source.dart';
import 'package:aifit/features/wom/data/wom_remote_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wom_repository.g.dart';

@riverpod
WomRepository getWomRepository(Ref ref) {
  return WomRepository(
    remoteDataSource: ref.watch(getWomRemoteDataSourceProvider),
    localDataSource: ref.watch(getWomLocalDataSourceProvider),
  );
}

class WomRepository {
  final WomRemoteDataSource _remoteDataSource;
  final WomLocalDataSource _localDataSource;

  WomRepository({
    required WomRemoteDataSource remoteDataSource,
    required WomLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  Future<void> redeemWom(int womCount) async {
    try {
      final response = await _remoteDataSource.getWom(womCount);
      await _localDataSource.saveWomTransaction(response);
    } catch (ex, st) {
      logger.e('redeemWom', error: ex, stackTrace: st);
    }
  }
}
