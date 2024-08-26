import 'dart:async';

import 'package:aifit/core/data/audio/repository/audio_repository_impl.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository_impl.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensor_tracking_provider.g.dart';

@riverpod
class SensorTrackingNotifier extends _$SensorTrackingNotifier {
  StreamSubscription? _sensorsStream;
  Timer? _timer;
  Stopwatch? _stopWatcher;
  // final defaultTestDurationInSeconds = 5;

  @override
  SensorTrackingState build() {
    ref.onDispose(cancel);
    return const SensorTrackingStateInitial();
  }

  Future start(int duration) async {
    state = const SensorTrackingStateInitial();
    await _sensorsStream?.cancel();
    _sensorsStream = null;
    ref.read(getAudioRepositoryProvider).playStart();
    HapticFeedback.heavyImpact();
    _sensorsStream =
        ref.read(getSensorsRepositoryProvider).listenSensors().listen(
              (data) {},
            );
    state = SensorTrackingStateData(
      remainingInSecond: duration.toDouble(),
    );
    logger.i('start listening');
    _stopWatcher = Stopwatch()..start();
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        final remainingInMilliseconds = (duration * 1000) -
            _stopWatcher!.elapsedMilliseconds;
        state = SensorTrackingStateData(
          remainingInSecond: remainingInMilliseconds / 1000,
        );

        // timers may have a 4ms resolution
        if (remainingInMilliseconds < 4) {
          stop();
        }
      },
    );
  }

  Future stop() async {
    logger.i('stop listening');
    state = const SensorTrackingStateInitial();
    HapticFeedback.heavyImpact();
    ref.read(getAudioRepositoryProvider).playStop();
    _stopWatcher?.stop();
    _timer?.cancel();
    await _sensorsStream?.cancel();
    _sensorsStream = null;
    _stopWatcher = null;
    _timer = null;
  }

  cancel() {
    _sensorsStream?.cancel();
  }
}
