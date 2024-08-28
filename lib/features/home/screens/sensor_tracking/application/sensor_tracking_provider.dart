import 'dart:async';

import 'package:aifit/constants.dart';
import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/data/activity_recognition/repository/ar_repository_impl.dart';
import 'package:aifit/core/data/audio/repository/audio_repository_impl.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository_impl.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensor_tracking_provider.g.dart';

@riverpod
class SensorTrackingNotifier extends _$SensorTrackingNotifier {
  StreamSubscription? _sensorsStream;
  StreamSubscription? _arStream;
  Timer? _timer;
  Stopwatch? _stopWatcher;

  final List<SensorsData> _sensorsData = [];

  ARData? _lastActivityRecognized;
  SensorData? _lastAccelerometer;
  SensorData? _lastGyroscope;
  SensorData? _lastMagnetometer;
  SmartphonePosition? _smartphonePosition;
  SensorActivityType? _sensorActivityType;

  @override
  SensorTrackingState build() {
    ref.onDispose(stop);
    return const SensorTrackingStateInitial();
  }

  Future start(
    int duration,
    SensorActivityType sensorActivityType,
    SmartphonePosition smartphonePosition,
  ) async {
    state = const SensorTrackingStateInitial();
    await reset();

    _sensorActivityType = sensorActivityType;
    _smartphonePosition = smartphonePosition;

    final t = Timer(Duration(seconds: 1), () {
      ref.read(getAudioRepositoryProvider).playStart();
      HapticFeedback.heavyImpact();
    });
    _arStream = ref.read(getArRepositoryProvider).activityStream().listen((ar) {
      _lastActivityRecognized = ARData()
        ..timestamp = DateTime.now()
        ..activity = ar.type.name
        ..confidence = ar.confidence.name;
    });
    _sensorsStream =
        ref.read(getSensorsRepositoryProvider).listenSensors().listen(
      (data) {
        _lastAccelerometer = data.$1;
        _lastGyroscope = data.$2;
        _lastMagnetometer = data.$3;

        if (!t.isActive &&
            _timer == null &&
            _lastAccelerometer != null &&
            _lastGyroscope != null &&
            _lastMagnetometer != null) {
          startSampling(duration);
        }
      },
    );
    state = SensorTrackingStateData(
      remainingInSecond: duration.toDouble(),
      samples: _sensorsData.length,
    );
    logger.i('start listening');
  }

  startSampling(int duration) {
    logger.i('Start sampling...');
    _stopWatcher = Stopwatch()..start();
    _timer = Timer.periodic(
      defaultSamplingPeriod,
      (timer) {
        final remainingInMilliseconds =
            (duration * 1000) - _stopWatcher!.elapsedMilliseconds;
        state = SensorTrackingStateData(
          remainingInSecond: remainingInMilliseconds / 1000,
          samples: 0,
        );

        final s = SensorsData();
        s.timestamp = DateTime.now();
        s.accelerometer = _lastAccelerometer;
        s.gyroscope = _lastGyroscope;
        s.magnetometer = _lastMagnetometer;
        s.activityRecognized = _lastActivityRecognized?.activity;
        _sensorsData.add(s);

        // timers may have a 4ms resolution
        if (remainingInMilliseconds < 4) {
          complete();
        }
      },
    );
  }

  Future stop() async {
    logger.i('stop listening');
    state = const SensorTrackingStateInitial();
    HapticFeedback.heavyImpact();
    ref.read(getAudioRepositoryProvider).playStop();
    reset();
  }

  complete() {
    logger.i('complete sampling');
    final track = SensorTrack();
    track.timestamp = DateTime.now();
    track.sensorsData = [..._sensorsData];
    track.smartphonePosition = _smartphonePosition;
    track.activityType = _sensorActivityType;
    state = SensorTrackingStateCompleted(track: track);
    HapticFeedback.heavyImpact();
    ref.read(getAudioRepositoryProvider).playStop();
    saveTrack(track);
    reset();
  }

  reset() async {
    logger.i('reset');
    _stopWatcher?.stop();
    _timer?.cancel();
    await _sensorsStream?.cancel();
    await _arStream?.cancel();
    _sensorsStream = null;
    _arStream = null;
    _stopWatcher = null;
    _timer = null;
    _sensorsData.clear();
    _lastAccelerometer = null;
    _lastGyroscope = null;
    _lastMagnetometer = null;
  }

  saveTrack(track) {
    return ref.read(getSensorsRepositoryProvider).saveTrack(track);
  }
}
