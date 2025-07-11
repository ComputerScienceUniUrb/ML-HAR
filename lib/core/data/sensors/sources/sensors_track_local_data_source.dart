import 'package:aifit/app/database/database.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';

import 'package:aifit/core/utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensors_track_local_data_source.g.dart';

@riverpod
SensorsTrackLocalDataSource getSensorsTrackLocalDataSource(
  Ref ref,
) {
  return SensorsTrackLocalDataSource(
    database: ref.read(getAppDatabaseProvider),
  );
}

class SensorsTrackLocalDataSource {
  final AppDatabase database;

  SensorsTrackLocalDataSource({required this.database});

  Future<void> saveTrack(SensorTrack track) async {
    try {
      await database.insertFullSensorTrack(track);
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
    final streamOfFullTracks = database.watchAllFullTracks();

    await for (final fullTracksList in streamOfFullTracks) {
      final List<SensorTrack> sensorTracks = fullTracksList
          .where((fullTrack) => fullTrack.dataEntries.isNotEmpty)
          .map((fullTrack) {
      return SensorTrack.fromDrift(fullTrack.track, fullTrack.dataEntries);
      }).toList();

      yield sensorTracks;
    }
  }
}
