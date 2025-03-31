import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/providers/isar/isar_provider.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:isar/isar.dart';

part 'sensors_track_local_data_source.g.dart';

@riverpod
SensorsTrackLocalDataSource getSensorsTrackLocalDataSource(
  GetSensorsTrackLocalDataSourceRef ref,
) {
  return SensorsTrackLocalDataSource(ref: ref);
}

class SensorsTrackLocalDataSource {
  final GetSensorsTrackLocalDataSourceRef ref;

  SensorsTrackLocalDataSource({required this.ref});

  Future<void> saveTrack(SensorTrack track) async {
    try {
      final isar = await ref.read(getIsarProvider.future);
      await isar.writeTxn(() async {
        await isar.sensorTracks.put(track);
      });
    } catch (ex, st) {
      logger.e(
        'SensorsTrackLocalDataSource: saveTrack',
        error: ex,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Stream<List<SensorTrack>> getSensorTracks() async* {
    final stream = (await ref.read(getIsarProvider.future))
        .sensorTracks
        .filter()
        .sensorsDataIsNotEmpty()
        .sortByTimestampDesc()
        .build();

    yield* stream.watch(fireImmediately: true);
  }
}
