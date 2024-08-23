import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/providers/isar/isar_provider.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ar_data_local_data_source.g.dart';

@riverpod
ArDataLocalDataSource getArLocalDataSource(GetArLocalDataSourceRef ref) {
  return ArDataLocalDataSource(ref: ref);
}

class ArDataLocalDataSource {
  final GetArLocalDataSourceRef ref;

  ArDataLocalDataSource({required this.ref});

  Stream<List<ARData>> aggregatedData() async* {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final query = (await ref.read(getIsarProvider.future))
        .aRDatas
        .filter()
        .timestampLessThan(today)
        .build();
    yield* query.watch(fireImmediately: true);
  }

  Stream<List<ARData>> getDailyRecords() async* {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final query = (await ref.read(getIsarProvider.future))
        .aRDatas
        .filter()
        .timestampBetween(today, today.copyWith(hour: 23, minute: 59))
        .sortByTimestampDesc()
        .build();
    yield* query.watch(fireImmediately: true);
  }

  Future<void> writeArData(Activity activity) async {
    final now = DateTime.now();
    final isar = await ref.read(getIsarProvider.future);
    final data = ARData()
      ..activity = activity.type.name
      ..confidence = activity.confidence.name
      ..timestamp = now;
    await isar.writeTxn(() async {
      await isar.aRDatas.put(data); // insert & update
    });
  }
}
