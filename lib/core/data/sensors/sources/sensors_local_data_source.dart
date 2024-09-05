import 'package:aifit/constants.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'sensors_local_data_source.g.dart';

@riverpod
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

  Stream<SensorData> listenGyroscopeSensors() {
    return gyroscopeEventStream(
      samplingPeriod: defaultSamplingPeriod,
    ).map(
      (e) => SensorData()
        ..x = e.x
        ..y = e.y
        ..z = e.z
        ..timestamp = e.timestamp,
    );
  }
}
