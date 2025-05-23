import 'dart:async';

import 'package:aifit/constants.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'sensors_local_data_source.g.dart';

@Riverpod(keepAlive: true)
SensorsLocalDataSource getSensorsLocalDataSource(
  GetSensorsLocalDataSourceRef ref,
) {
  return SensorsLocalDataSource(ref: ref);
}

class SensorsLocalDataSource {
  final GetSensorsLocalDataSourceRef ref;

  SensorsLocalDataSource({required this.ref});

  Stream<SensorData> listenAccelerometerSensors() {
    return userAccelerometerEventStream(
      samplingPeriod: defaultSamplingPeriod,
    ).map(
      (e) => SensorData()
        ..x = e.x
        ..y = e.y
        ..z = e.z
        ..timestamp = e.timestamp,
    );
  }

  Stream<SensorData> listenAccelerometerWithGravitySensors() {
    return accelerometerEventStream(
      samplingPeriod: defaultSamplingPeriod,
    ).map(
      (e) => SensorData()
        ..x = e.x
        ..y = e.y
        ..z = e.z
        ..timestamp = e.timestamp,
    );
  }

  Stream<SensorData> listenMagnetometerSensors() {
    return magnetometerEventStream(
      samplingPeriod: defaultSamplingPeriod,
    ).map(
      (e) => SensorData()
        ..x = e.x
        ..y = e.y
        ..z = e.z
        ..timestamp = e.timestamp,
    );
  }

  // late final listenGyroscopeSensors = _gyroscopeData.stream;
  // final _gyroscopeData = BehaviorSubject<SensorData>();

  Stream<SensorData> gyroscopeStream() => gyroController.stream;
  final StreamController<SensorData> gyroController =
      StreamController.broadcast();

  StreamSubscription? _gyroscopeStreamSubscription;

  void startListeningGyroscopeData() {
    try {
      _gyroscopeStreamSubscription?.cancel();

      _gyroscopeStreamSubscription =
          gyroscopeEventStream(samplingPeriod: defaultSamplingPeriod).listen(
        (e) {
          final data = SensorData()
            ..x = e.x
            ..y = e.y
            ..z = e.z
            ..timestamp = e.timestamp;
          gyroController.add(data);
        },
        onError: (error) {
          logger.e('startListeningGyroscopeData: listen', error: error);
        },
        cancelOnError: true,
      );
    } catch (ex, st) {
      logger.e('startListeningGyroscopeData', error: ex, stackTrace: st);
    }
  }

  Stream<SensorData> userAccelerometerStream() =>
      userAccelerometerController.stream;
  final StreamController<SensorData> userAccelerometerController =
      StreamController.broadcast();

  StreamSubscription? _userAccelerometerStreamSubscription;

  /// Returns a broadcast stream of events from the device accelerometer with
  /// gravity removed at the given sampling frequency.
  void startListeningUserAccelerometerData() {
    try {
      _userAccelerometerStreamSubscription?.cancel();

      _userAccelerometerStreamSubscription =
          userAccelerometerEventStream(samplingPeriod: defaultSamplingPeriod)
              .listen(
        (e) {
          final data = SensorData()
            ..x = e.x
            ..y = e.y
            ..z = e.z
            ..timestamp = e.timestamp;
          userAccelerometerController.add(data);
        },
        onError: (error) {
          logger.e('startListeningUserAccelerometerData: listen', error: error);
        },
        cancelOnError: true,
      );
    } catch (ex, st) {
      logger.e('startListeningUserAccelerometerData', error: ex, stackTrace: st);
    }
  }
}
