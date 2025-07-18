import 'dart:async';

import 'package:aifit/app/database/database.dart';
import 'package:aifit/core/data/firestore_reference.dart';
import 'package:aifit/core/data/user/models/gender.dart';
import 'package:aifit/core/data/user/repository/user_repository_impl.dart';
import 'package:aifit/core/providers/secure_storage.dart';
import 'package:aifit/features/session/models/player.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_player_notifier.g.dart';

sealed class SessionPlayerState {
  final String? playerId;

  SessionPlayerState({this.playerId});
}

class SessionPlayerInitial extends SessionPlayerState {}

class SessionPlayerLoading extends SessionPlayerState {}

class SessionPlayerLoaded extends SessionPlayerState {
  final Player player;

  SessionPlayerLoaded({super.playerId, required this.player});
}

@riverpod
class SessionPlayerNotifier extends _$SessionPlayerNotifier {
  StreamSubscription? _playerSub;

  @override
  SessionPlayerState build(String sessionId) {
    ref.onDispose(() {
      _playerSub?.cancel();
    });
    _init();
    return SessionPlayerInitial();
  }

  _init() async {
    try {
      await Future.delayed(Duration.zero);
      state = SessionPlayerLoading();
      var session = await ref
          .read(getAppDatabaseProvider)
          .sessionsDao
          .getSessionById(sessionId);
      var playerId = session?.userId;
      playerId ??= await subscribePlayer();
      listenPlayerDoc(playerId);
    } catch (ex, st) {
      print(ex);
      print(st);
      state = SessionPlayerInitial();
    }
  }

  Future listenPlayerDoc(String playerId) async {
    _playerSub?.cancel();
    final playerRef = FirestoreReference.playerDoc(sessionId, playerId);
    _playerSub = playerRef.snapshots().listen((event) {
      try {
        final data = event.data() as Map<String, dynamic>?;
        if (event.exists && data != null) {
          final player = Player.fromJson(data);
          state = SessionPlayerLoaded(player: player);
          // await ref.read(getFlutterSecureStorageProvider).write(key: sessionId, value: value);
        }
      } catch (ex, st) {
        print(ex);
        print(st);
      }
    });
  }

  Future<String> subscribePlayer() async {
    try {
      final userInfo  = await ref.read(getUserRepositoryProvider).getUserInfo();
      final result = await FirebaseFunctions.instanceFor(region: 'europe-west3')
          .httpsCallable('subscribeToSession')
          .call({
        'gender': userInfo.gender?.name,
        'age': userInfo.age,
        'height': userInfo.height,
        'weight': userInfo.weight,
        'sessionId': sessionId,
      });

      final userId = result.data as String;
      // await ref.read(getAppDatabaseProvider).mySessionsDao.upsertSession(
      //       MySessionsCompanion(
      //         sessionId: Value(sessionId),
      //         gender: Value(Gender.male),
      //         height: Value(171),
      //         weight: Value(70.5),
      //         age: Value(44),
      //         userId: Value(userId),
      //       ),
      //     );
      return userId;
    } on FirebaseFunctionsException catch (error) {
      print(error.code);
      print(error.details);
      print(error.message);
      rethrow;
    } catch (ex) {
      rethrow;
    }
  }
}
