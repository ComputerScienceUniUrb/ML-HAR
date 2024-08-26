import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'sensors_local_data_source.g.dart';

@riverpod
SensorsLocalDataSource getSensorsLocalDataSource(GetSensorsLocalDataSourceRef ref) {
  return SensorsLocalDataSource();
}

class SensorsLocalDataSource {
  Stream<UserAccelerometerEvent> listenAccelerometerSensors() {
    return userAccelerometerEventStream();
  }

  Stream<MagnetometerEvent> listenMagnetometerSensors() {
    return magnetometerEventStream();
  }

  Stream<GyroscopeEvent> listenGyroscopeSensors() {
    return gyroscopeEventStream();
  }
}
