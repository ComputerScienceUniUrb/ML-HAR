import 'package:aifit/app/database/database.dart';
import 'package:aifit/core/providers/secure_storage.dart';
import 'package:aifit/features/session/models/activity_session.dart';
import 'package:aifit/features/session/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'session_notifier.g.dart';

@riverpod
Stream<ActivitySession> getSessionsById(Ref ref, String sessionId) async* {
  final ref = FirebaseFirestore.instance.collection('sessions').doc(sessionId);
  final stream = ref.snapshots();
  await for (final s in stream) {
    try {
      final data = s.data();
      if (s.exists && data != null) {
        yield ActivitySession.fromJson(data);
      }
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}

@riverpod
Stream<Player?> getSessionPlayer(
  Ref ref,
  String sessionId,
) async* {
  final playerId =
      await ref.read(getFlutterSecureStorageProvider).read(key: sessionId);

  if (playerId != null) {
    final playerRef = FirebaseFirestore.instance
        .collection('sessions')
        .doc(sessionId)
        .collection('players')
        .doc(playerId);
    final stream = playerRef.snapshots();
    await for (final s in stream) {
      try {
        final data = s.data();
        if (s.exists && data != null) {
          yield Player.fromJson(data);
        } else {
          yield null;
        }
      } catch (ex, st) {
        print(ex);
        print(st);
      }
    }
  } else {
    yield null;
  }
}

@riverpod
Stream<List<SensorTrackData>> getTestsBySessionId(
    Ref ref, String sessionId) async* {
  yield* ref
      .read(getAppDatabaseProvider)
      .sensorTracksDao
      .watchTracksBySessionId(sessionId);
}

@riverpod
Stream<List<GroupedSession>> groupedSessions(Ref ref) {
  // 1. Ottieni il DAO
  final tracksDao = ref.watch(getAppDatabaseProvider).sensorTracksDao;

  // 2. Osserva la lista piatta di tutte le tracce
  final allTracksStream = tracksDao.watchAllTracksWithSessionId();

  // 3. Mappa lo stream per trasformare i dati
  return allTracksStream.map((allTracks) {
    if (allTracks.isEmpty) {
      return [];
    }

    // 4. Raggruppa le tracce per sessionId usando il pacchetto 'collection'
    final Map<String, List<SensorTrackData>> tracksBySessionId = groupBy(
      allTracks,
      (track) => track.sessionId ?? 'null',
    );

    // 5. Converti la mappa in una lista di GroupedSession
    final groupedList = tracksBySessionId.entries.map((entry) {
      return GroupedSession(
        sessionId: entry.key,
        tracks: entry.value,
      );
    }).toList();

    // 6. (Opzionale ma consigliato) Ordina le sessioni per data, dalla più recente
    // groupedList.sort((a, b) => b.firstTrackDate.compareTo(a.firstTrackDate));

    return groupedList;
  });
}
