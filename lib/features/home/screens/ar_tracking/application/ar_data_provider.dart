import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/data/activity_recognition/repository/ar_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ar_data_provider.g.dart';

@riverpod
Stream<List<ARData>> getDailyRecords(GetDailyRecordsRef ref) {
  return ref.read(getArRepositoryProvider).getDailyRecords();
}

@riverpod
Stream<Map<DateTime, List<ARData>>> getAggregatedDay(
  GetAggregatedDayRef ref,
) {
  return ref.read(getArRepositoryProvider).getAggregatedDataByDay();
}
