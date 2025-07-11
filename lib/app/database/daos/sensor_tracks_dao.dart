import 'package:aifit/app/database/database.dart';
import 'package:aifit/app/database/tables.dart';
import 'package:drift/drift.dart';

part 'sensor_tracks_dao.g.dart';

@DriftAccessor(tables: [SensorTracks])
class SensorTracksDao extends DatabaseAccessor<AppDatabase>
    with _$SensorTracksDaoMixin {
  SensorTracksDao(super.db);

  // Ottiene tutti i tracciati
  Future<List<SensorTrackData>> getAllTracks() => select(sensorTracks).get();

  // Osserva tutti i tracciati e notifica i cambiamenti
  Stream<List<SensorTrackData>> watchAllTracks() =>
      select(sensorTracks).watch();

  // Osserva tutti i tracciati e notifica i cambiamenti
  Stream<List<SensorTrackData>> watchAllTracksWithSessionId() =>
      (select(sensorTracks)..where((tbl) => tbl.sessionId.isNotNull())).watch();

  /// Osserva i tracciati per un sessionId specifico e notifica i cambiamenti.
  Stream<List<SensorTrackData>> watchTracksBySessionId(String sessionId) {
    return (select(sensorTracks)
          ..where((tbl) => tbl.sessionId.equals(sessionId)))
        .watch();
  }

  // Inserisce un singolo tracciato
  Future<int> insertTrack(SensorTracksCompanion track) =>
      into(sensorTracks).insert(track);

  // Aggiorna un tracciato
  Future<bool> updateTrack(SensorTracksCompanion track) =>
      update(sensorTracks).replace(track);

  // Elimina un tracciato
  Future<int> deleteTrack(SensorTrackData track) =>
      delete(sensorTracks).delete(track);
}

@DriftAccessor(tables: [SensorsDataEntries])
class SensorsDataEntriesDao extends DatabaseAccessor<AppDatabase>
    with _$SensorsDataEntriesDaoMixin {
  SensorsDataEntriesDao(super.db);

  // Ottiene tutte le entry per un tracciato specifico
  Future<List<SensorsDataEntry>> getEntriesForTrack(int trackId) {
    return (select(sensorsDataEntries)
          ..where((tbl) => tbl.trackId.equals(trackId)))
        .get();
  }

  // Osserva le entry per un tracciato specifico
  Stream<List<SensorsDataEntry>> watchEntriesForTrack(int trackId) {
    return (select(sensorsDataEntries)
          ..where((tbl) => tbl.trackId.equals(trackId)))
        .watch();
  }

  // Inserisce una lista di entry in un'unica operazione (molto efficiente)
  Future<void> insertEntries(List<SensorsDataEntriesCompanion> entries) async {
    await batch((batch) {
      batch.insertAll(sensorsDataEntries, entries);
    });
  }
}
