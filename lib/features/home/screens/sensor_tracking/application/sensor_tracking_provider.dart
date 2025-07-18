import 'dart:async';

import 'package:aifit/app/database/database.dart';
import 'package:aifit/constants.dart';
import 'package:aifit/core/data/activity_recognition/repository/ar_repository_impl.dart';
import 'package:aifit/core/data/audio/repository/audio_repository_impl.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository_impl.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:aifit/features/settings/screens/user_details/application/user_details_notifier.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'sensor_tracking_provider.g.dart';

@Riverpod(keepAlive: true)
class SensorTrackingNotifier extends _$SensorTrackingNotifier {
  StreamSubscription? _sensorsStreamSubscription;
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
  String? _experimentId;
  String? _sessionId;

  @override
  SensorTrackingState build() {
    ref.onDispose(closeSubscriptions);
    ref.read(getSensorsRepositoryProvider).init();
    init();
    return const SensorTrackingStateInitial();
  }

  init() {
    _sensorsStreamSubscription =
        ref.read(getSensorsRepositoryProvider).listenSensors().listen(
      (data) {
        _lastAccelerometer = data.$1;
        _lastAccelerometerWithGravity = data.$2;
        _lastGyroscope = data.$3;
        _lastMagnetometer = data.$4;
      },
      onError: (ex, st) {
        logger.e(
          'SensorTrackingProvider: sensors stream',
          error: ex,
          stackTrace: st,
        );
      },
    );

    _arStream = ref.read(getArRepositoryProvider).activityStream().listen(
      (ar) {
        logger.i('Activity Recognition: ${ar.type}');
        _lastActivityRecognized = ar.type.name;
      },
      onError: (ex, st) {
        logger.e(
          'SensorTrackingProvider: activity stream',
          error: ex,
          stackTrace: st,
        );
      },
    );
  }

  Future start({
    required int duration,
    required SensorActivityType sensorActivityType,
    required SmartphonePosition smartphonePosition,
    required bool retainNullValue,
    String? experimentId,
    String? sessionId,
  }) async {
    if (state is SensorTrackingStateData) return;
    state = const SensorTrackingStateInitial();
    WakelockPlus.enable();

    try {
      _startBatteryLevel = await _battery.batteryLevel;
    } catch (ex, st) {
      logger.e('start', error: ex, stackTrace: st);
    }
    _testDuration = duration;
    _sensorActivityType = sensorActivityType;
    _smartphonePosition = smartphonePosition;
    if (experimentId?.isNotEmpty ?? false) {
      _experimentId = experimentId;
    }

    if (sessionId?.isNotEmpty ?? false) {
      _sessionId = sessionId;
    }
    ref.read(getAudioRepositoryProvider).playPreStart();
    final t = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > 4) {
        timer.cancel();
        ref.read(getAudioRepositoryProvider).playStart();
        HapticFeedback.heavyImpact();
      } else if (timer.tick > 3) {
        ref.read(getAudioRepositoryProvider).playPreStart();
        final areValuesPopulated = _lastAccelerometer != null &&
            _lastAccelerometerWithGravity != null &&
            _lastMagnetometer != null;

        if (areValuesPopulated || retainNullValue) {
          _startSampling(duration);
        } else {
          logger.e(
            'values are not populated, '
            '_lastAccelerometer: $_lastAccelerometer, '
            '_lastAccelerometerWithGravity:$_lastAccelerometerWithGravity, '
            '_lastMagnetometer:$_lastMagnetometer, '
            '_lastGyroscope:$_lastGyroscope',
          );
        }
      } else {
        ref.read(getAudioRepositoryProvider).playPreStart();
      }
    });
    state = SensorTrackingStateData(
      remainingInSecond: duration.toDouble(),
      samples: _sensorsData.length,
      activityRecognized: _lastActivityRecognized,
    );
    logger.i('start listening');
  }

  _startSampling(int duration) {
    logger.i('Start sampling...');
    _sensorsData.clear();
    _stopWatcher = Stopwatch()..start();
    _timer = Timer.periodic(
      defaultSamplingPeriod,
      (timer) {
        final remainingInMilliseconds =
            ((duration + 1) * 1000) - _stopWatcher!.elapsedMilliseconds;

        if (remainingInMilliseconds <= duration * 1000) {
          state = SensorTrackingStateData(
            remainingInSecond: remainingInMilliseconds / 1000,
            samples: 0,
            activityRecognized: _lastActivityRecognized,
          );
        }

        final s = SensorsData(
          timestamp: DateTime.now(),
          accelerometer: _lastAccelerometer,
          accelerometerWithGravity: _lastAccelerometerWithGravity,
          gyroscope: _lastGyroscope,
          magnetometer: _lastMagnetometer,
          activityRecognized: _lastActivityRecognized,
        );
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
        state is SensorTrackingStateCompleted ||
        state is SensorTrackingStateUploaded) {
      return;
    }
    state = const SensorTrackingStateInitial();
    HapticFeedback.heavyImpact();
    ref.read(getAudioRepositoryProvider).playStop();
    reset();
  }

  addWomReward() {
    ref.read(getAppDatabaseProvider).womRewardsDao.addReward(
          WomRewardsCompanion(
            womCount: Value(5),
            experimentId: Value(_experimentId),
            sessionId: Value(_sessionId),
            addedOn: Value(DateTime.now()),
            // TODO add userId?
          ),
        );
  }

  Future _completeSampling() async {
    logger.i('complete sampling');
    final userInfo = await ref.read(userDetailsNotifierProvider.future);

    var isInBatterySaveMode = false;
    try {
      isInBatterySaveMode = await _battery.isInBatterySaveMode;
    } catch (ex, st) {
      logger.w('_completeSampling', error: ex, stackTrace: st);
    }
    final track = SensorTrack(
      id: const Uuid().v4(),
      timestamp: DateTime.now(),
      sensorsData: [..._sensorsData],
      smartphonePosition: _smartphonePosition,
      activityType: _sensorActivityType,
      userInfo: userInfo,
      testDuration: _testDuration,
      startBatteryLevel: _startBatteryLevel,
      isInBatterySaveMode: isInBatterySaveMode,
      cloudId: null,
      experimentId: _experimentId,
      sessionId: _sessionId,
    );
    state = SensorTrackingStateCompleted(track: track);
    HapticFeedback.heavyImpact();
    ref.read(getAudioRepositoryProvider).playStop();
    addWomReward();
    saveTrack(track);
    reset();
    _isCompleting = false;
    uploadTrack();
  }

  Future<void> reset() async {
    logger.i('reset');
    _stopWatcher?.stop();
    _timer?.cancel();
    _stopWatcher = null;
    _timer = null;
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
    try {
      _stopWatcher?.stop();
      _timer?.cancel();
      _stopWatcher = null;
      _timer = null;
      await _sensorsStreamSubscription?.cancel();
      await _arStream?.cancel();
      _sensorsStreamSubscription = null;
      _arStream = null;
    } catch (ex, st) {
      logger.e('closeSubscriptions', error: ex, stackTrace: st);
    }
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
          logger.e(
            'SensorTrackingProvider: uploadTrack',
            error: ex,
            stackTrace: st,
          );
          state = currentState.copyWith(isUploading: false, error: ex);
        }
      }
    }
  }

  Future dispose() async {
    await closeSubscriptions();
  }
}
