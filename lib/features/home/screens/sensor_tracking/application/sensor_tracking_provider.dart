import 'dart:async';

import 'package:aifit/constants.dart';
import 'package:aifit/core/data/activity_recognition/repository/ar_repository_impl.dart';
import 'package:aifit/core/data/audio/repository/audio_repository_impl.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository_impl.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/user_info_notifier.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'sensor_tracking_provider.g.dart';

@Riverpod(keepAlive: true)
class SensorTrackingNotifier extends _$SensorTrackingNotifier {
  StreamSubscription? _sensorsStream;
  StreamSubscription? _arStream;
  Timer? _timer;
  Stopwatch? _stopWatcher;

  final _battery = Battery();
  final List<SensorsData> _sensorsData = [];

  String? _lastActivityRecognized;
  SensorData? _lastAccelerometer;
  SensorData? _lastAccelerometerWithGravity;
  SensorData? _lastGyroscope;
  SensorData? _lastMagnetometer;
  SmartphonePosition? _smartphonePosition;
  SensorActivityType? _sensorActivityType;
  int _testDuration = -1;
  int _startBatteryLevel = -1;

  @override
  SensorTrackingState build() {
    ref.onDispose(closeSubscriptions);
    return const SensorTrackingStateInitial();
  }

  Future start(
    int duration,
    SensorActivityType sensorActivityType,
    SmartphonePosition smartphonePosition,
    bool retainNullValue,
  ) async {
    if (state is SensorTrackingStateData) return;
    state = const SensorTrackingStateInitial();
    await reset();
    WakelockPlus.enable();

    _startBatteryLevel = await _battery.batteryLevel;
    _testDuration = duration;
    _sensorActivityType = sensorActivityType;
    _smartphonePosition = smartphonePosition;
    ref.read(getAudioRepositoryProvider).playPreStart();
    final t = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > 4) {
        timer.cancel();
        ref.read(getAudioRepositoryProvider).playStart();
        HapticFeedback.heavyImpact();
      } else {
        ref.read(getAudioRepositoryProvider).playPreStart();
      }
    });
    _arStream = ref.read(getArRepositoryProvider).activityStream().listen((ar) {
      logger.i('Activity Recognition: ${ar.type}');
      _lastActivityRecognized = ar.type.name;
    });
    _sensorsStream =
        ref.read(getSensorsRepositoryProvider).listenSensors().listen(
      (data) {
        _lastAccelerometer = data.$1;
        _lastAccelerometerWithGravity = data.$2;
        _lastGyroscope = data.$3;
        _lastMagnetometer = data.$4;

        final areValuesPopulated = _lastAccelerometer != null &&
            _lastAccelerometerWithGravity != null &&
            _lastGyroscope != null &&
            _lastMagnetometer != null;

        if (!t.isActive &&
            _timer == null &&
            (areValuesPopulated || retainNullValue)) {
          _startSampling(duration);
        }
      },
    );
    state = SensorTrackingStateData(
      remainingInSecond: duration.toDouble(),
      samples: _sensorsData.length,
      activityRecognized: _lastActivityRecognized,
    );
    logger.i('start listening');
  }

  _startSampling(int duration) {
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
          activityRecognized: _lastActivityRecognized,
        );

        final s = SensorsData();
        s.timestamp = DateTime.now();
        s.accelerometer = _lastAccelerometer;
        s.accelerometerWithGravity = _lastAccelerometerWithGravity;
        s.gyroscope = _lastGyroscope;
        s.magnetometer = _lastMagnetometer;
        s.activityRecognized = _lastActivityRecognized;
        _sensorsData.add(s);

        // timers may have a 4ms resolution
        if (remainingInMilliseconds < 4 && !_isCompleting) {
          _isCompleting = true;
          _completeSampling();
        }
      },
    );
  }

  bool _isCompleting = false;

  Future stop() async {
    logger.i('stop listening');
    if (state is SensorTrackingStateInitial ||
        state is SensorTrackingStateCompleted) return;
    state = const SensorTrackingStateInitial();
    HapticFeedback.heavyImpact();
    ref.read(getAudioRepositoryProvider).playStop();
    reset();
  }

  _completeSampling() async {
    logger.i('complete sampling');
    final userInfo = await ref.read(getUserInfoProvider.future);
    final track = SensorTrack(
      timestamp: DateTime.now(),
      sensorsData: [..._sensorsData],
      smartphonePosition: _smartphonePosition,
      activityType: _sensorActivityType,
      userInfo: userInfo,
      testDuration: _testDuration,
      startBatteryLevel: _startBatteryLevel,
      isInBatterySaveMode: await _battery.isInBatterySaveMode,
      cloudId: null,
    );
    state = SensorTrackingStateCompleted(track: track);
    HapticFeedback.heavyImpact();
    ref.read(getAudioRepositoryProvider).playStop();
    saveTrack(track);
    reset();
    _isCompleting = false;
  }

  Future<void> reset() async {
    logger.i('reset');
    await closeSubscriptions();
    await WakelockPlus.disable();
    _sensorsData.clear();
    _lastAccelerometer = null;
    _lastAccelerometerWithGravity = null;
    _lastGyroscope = null;
    _lastMagnetometer = null;
    _lastActivityRecognized = null;
    _startBatteryLevel = -1;
  }

  Future closeSubscriptions() async {
    _stopWatcher?.stop();
    _timer?.cancel();
    _stopWatcher = null;
    _timer = null;
    await _sensorsStream?.cancel();
    await _arStream?.cancel();
    _sensorsStream = null;
    _arStream = null;
  }

  Future<void> saveTrack(SensorTrack track) {
    return ref.read(getSensorsRepositoryProvider).saveTrack(track);
  }

  Future<void> uploadTrack() async {
    final currentState = state;
    if (currentState is SensorTrackingStateCompleted) {
      if (!currentState.isUploading) {
        try {
          state = currentState.copyWith(isUploading: true);
          await ref
              .read(getSensorsRepositoryProvider)
              .uploadTrack(currentState.track);
          state = SensorTrackingStateUploaded(track: currentState.track);
        } catch (ex, st) {
          state = currentState.copyWith(isUploading: false, error: ex);
        }
      }
    }
  }
}
