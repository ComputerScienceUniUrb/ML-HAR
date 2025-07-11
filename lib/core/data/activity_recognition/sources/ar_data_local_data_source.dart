import 'package:aifit/app/database/database.dart';
import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';

import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'ar_data_local_data_source.g.dart';

@riverpod
ArDataLocalDataSource getArLocalDataSource(Ref ref) {
  return ArDataLocalDataSource(database: ref.read(getAppDatabaseProvider));
}

class ArDataLocalDataSource {
  final AppDatabase database;

  ArDataLocalDataSource({required this.database});

  Stream<List<ARData>> aggregatedData() async* {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    // await database.
    // final query = (await ref.read(getIsarProvider.future))
    //     .aRDatas
    //     .filter()
    //     .timestampLessThan(today)
    //     .build();
    // yield* query.watch(fireImmediately: true);
  }

  Stream<List<ARData>> getDailyRecords() async* {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    // final query = (await ref.read(getIsarProvider.future))
    //     .aRDatas
    //     .filter()
    //     .timestampBetween(today, today.copyWith(hour: 23, minute: 59))
    //     .sortByTimestampDesc()
    //     .build();
    // yield* query.watch(fireImmediately: true);
  }

  Future<void> writeArData(Activity activity) async {
    final now = DateTime.now();
    final data = ARData(
      const Uuid().v4(),
      activity.type.name,
      activity.confidence.name,
      now,
    );

    // TODO scrivere su db
  }
}
