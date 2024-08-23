import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/data/activity_recognition/repository/ar_repository.dart';
import 'package:aifit/core/data/activity_recognition/sources/ar_activity_data_source.dart';
import 'package:aifit/core/data/activity_recognition/sources/ar_data_local_data_source.dart';
import 'package:aifit/core/utils/date_extension.dart';
import 'package:flutter_activity_recognition/models/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ar_repository_impl.g.dart';

@riverpod
ArRepository getArRepository(GetArRepositoryRef ref) {
  return ArRepositoryImpl(
    arDataLocalDataSource: ref.read(getArLocalDataSourceProvider),
    arActivityDataSource: ref.read(getArActivityDataSourceProvider),
  );
}

class ArRepositoryImpl implements ArRepository {
  final ArActivityDataSource arActivityDataSource;
  final ArDataLocalDataSource arDataLocalDataSource;

  ArRepositoryImpl({
    required this.arDataLocalDataSource,
    required this.arActivityDataSource,
  });

  @override
  Stream<Map<DateTime, List<ARData>>> getAggregatedDataByDay() {
    return arDataLocalDataSource.aggregatedData().map((results) {
      final map = <DateTime, List<ARData>>{};

      for (final r in results) {
        if (r.timestamp != null) {
          if (map.containsKey(r.timestamp!.midnight)) {
            map[r.timestamp!.midnight]?.add(r);
          } else {
            map[r.timestamp!.midnight] = [r];
          }
        }
      }
      return map;
    });
  }

  @override
  Stream<List<ARData>> getDailyRecords() {
    return arDataLocalDataSource.getDailyRecords();
  }

  @override
  Stream<Activity> activityStream() {
    return arActivityDataSource.activityStream();
  }

  @override
  Future<void> writeArData(Activity activity) {
    return arDataLocalDataSource.writeArData(activity);
  }
}
