import 'dart:async';

import 'package:aifit/core/data/activity_recognition/repository/ar_repository.dart';
import 'package:aifit/core/data/activity_recognition/repository/ar_repository_impl.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:intl/intl.dart';

part 'ar_stream_provider.freezed.dart';

part 'ar_stream_provider.g.dart';

final format = DateFormat('dd-MM-yy');

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.data({Activity? activity, DateTime? timestamp}) =
  ActivityStateData;

  const factory ActivityState.loading() = ActivityStateLoading;

  const factory ActivityState.stop() = ActivityStateStop;

  const factory ActivityState.error(Object error, StackTrace st) =
  ActivityStateError;
}

@riverpod
class ActivityErrorNotifier extends _$ActivityErrorNotifier {
  @override
  String? build() {
    return null;
  }

  showError(String error) {
    state = error;
    Future.delayed(const Duration(seconds: 1), () {
      state = null;
    });
  }
}

@riverpod
class ActivityNotifier extends _$ActivityNotifier {
  StreamSubscription? _streamSubscription;

  late ArRepository _arRepository;

  @override
  ActivityState build() {

    ref.onDispose(_onDispose);
    _arRepository = ref.read(getArRepositoryProvider);
    return const ActivityStateStop();
  }

  _onDispose() {
    _streamSubscription?.cancel();
  }

  start() {
    stop();
    logger.i('Start Activity Stream');
    state = const ActivityStateData(activity: null);
    _streamSubscription = ref
        .read(getArRepositoryProvider)
        .activityStream()
        .handleError(_handleError)
        .listen(
          (activity) {
        logger.i('onActivityStream');
        final now = DateTime.now();
        final lastUpdate = state is ActivityStateData
            ? (state as ActivityStateData).timestamp
            : null;
        state = ActivityStateData(
          activity: activity,
          timestamp: DateTime.now(),
        );

        _writeOnDb(activity);

        // if (lastUpdate == null || now
        //     .difference(lastUpdate)
        //     .inSeconds >= 5) {-
        //   _writeOnDb(activity);
        // }
      },
    );
  }

  _handleError(dynamic error) {
    logger.e(error);
    ref.read(activityErrorNotifierProvider.notifier).showError(error.toString());
  }

  void stop() {
    logger.i('Stop Activity Stream');
    _streamSubscription?.cancel();
    _streamSubscription = null;
    state = const ActivityStateStop();
  }

  Future<void> _writeOnDb(Activity activity) async {
    logger.i('_writeOnDb');
    return _arRepository.writeArData(activity);
  }
}
