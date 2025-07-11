import 'dart:io';
import 'package:aifit/app/database/daos/sensor_tracks_dao.dart';
import 'package:aifit/app/database/daos/sessions_dao.dart';
import 'package:aifit/app/database/daos/wom_rewards_dao.dart';
import 'package:aifit/app/database/daos/wom_transactions_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:aifit/core/data/user/models/gender.dart';
import 'tables.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart' as legacy;
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/data/user/models/user_info.dart';

part 'database.g.dart';


class GroupedSession {
  final String sessionId;
  final List<SensorTrackData> tracks;

  GroupedSession({
    required this.sessionId,
    required this.tracks,
  });
}

/// Classe di convenienza per tenere insieme un SensorTrack e la sua lista di dati.
class FullSensorTrack {
  final SensorTrackData track;
  final List<SensorsDataEntry> dataEntries;

  FullSensorTrack({required this.track, required this.dataEntries});
}

@Riverpod(keepAlive: true)
AppDatabase getAppDatabase(Ref ref) {
  return AppDatabase();
}

@DriftDatabase(
  tables: [SensorTracks, SensorsDataEntries, Sessions, WomTransactions, WomRewards],
  daos: [SensorTracksDao, SensorsDataEntriesDao, SessionsDao, WomTransactionsDao, WomRewardsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Osserva tutti i SensorTrack completi (tracciato + dati sensore)
  /// e li emette come stream.
  Stream<List<FullSensorTrack>> watchAllFullTracks() {
    final query = select(sensorTracks).join([
      leftOuterJoin(sensorsDataEntries,
          sensorsDataEntries.trackId.equalsExp(sensorTracks.id)),
    ])
      ..orderBy([
        OrderingTerm.desc(sensorTracks.timestamp)
      ]); // Ordina per timestamp decrescente

    return query.watch().map((rows) {
      final Map<int, FullSensorTrack> fullTracksMap = {};

      for (final row in rows) {
        final trackData = row.readTable(sensorTracks);
        // readTableOrNull perché con LEFT OUTER JOIN sensorsDataEntries potrebbe essere null
        final sensorsDataEntry = row.readTableOrNull(sensorsDataEntries);

        // Raggruppa le entry di SensorsData sotto il loro SensorTrack principale
        FullSensorTrack fullTrack = fullTracksMap.putIfAbsent(
          trackData.id,
          () => FullSensorTrack(track: trackData, dataEntries: []),
        );

        if (sensorsDataEntry != null) {
          fullTrack.dataEntries.add(sensorsDataEntry);
        }
      }
      // Ritorna la lista di FullSensorTrack, ordinata come richiesto dalla query
      return fullTracksMap.values.toList();
    });
  }

  // Esempio di query per inserire un SensorTrack completo (con i suoi dati)
  Future<void> insertFullSensorTrack(legacy.SensorTrack legacyTrack) async {
    await transaction(() async {
      // 1. Inserisci il SensorTrack principale e ottieni il suo ID
      final trackId = await into(sensorTracks).insert(
        SensorTracksCompanion.insert(
          activityType: Value(legacyTrack.activityType),
          smartphonePosition: Value(legacyTrack.smartphonePosition),
          timestamp: Value(legacyTrack.timestamp),
          userInfo: Value(legacyTrack.userInfo),
          startBatteryLevel: Value(legacyTrack.startBatteryLevel),
          isInBatterySaveMode: Value(legacyTrack.isInBatterySaveMode),
          cloudId: Value(legacyTrack.cloudId),
          testDuration: Value(legacyTrack.testDuration),
          experimentId: Value(legacyTrack.experimentId),
          sessionId: Value(legacyTrack.sessionId),
        ),
      );

      // 2. Inserisci tutte le entry di dati associate, collegandole con trackId
      if (legacyTrack.sensorsData != null &&
          legacyTrack.sensorsData!.isNotEmpty) {
        final companions = legacyTrack.sensorsData!.map(
          (dataPoint) => SensorsDataEntriesCompanion.insert(
            trackId: trackId,
            accelerometer: Value(dataPoint.accelerometer),
            accelerometerWithGravity: Value(dataPoint.accelerometerWithGravity),
            gyroscope: Value(dataPoint.gyroscope),
            magnetometer: Value(dataPoint.magnetometer),
            activityRecognized: Value(dataPoint.activityRecognized),
            timestamp: Value(dataPoint.timestamp),
          ),
        );
        await batch((batch) => batch.insertAll(sensorsDataEntries, companions));
      }
    });
  }
}

// Apre la connessione al database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
