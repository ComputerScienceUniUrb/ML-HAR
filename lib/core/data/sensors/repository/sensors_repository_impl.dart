import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository.dart';
import 'package:aifit/core/data/sensors/sources/sensors_local_data_source.dart';
import 'package:aifit/core/data/sensors/sources/sensors_track_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'sensors_repository_impl.g.dart';

@riverpod
SensorsRepository getSensorsRepository(GetSensorsRepositoryRef ref) {
  return SensorsRepositoryImpl(
    sensorsLocalDataSource: ref.read(getSensorsLocalDataSourceProvider),
    sensorsTrackLocalDataSource:
        ref.read(getSensorsTrackLocalDataSourceProvider),
  );
}

class SensorsRepositoryImpl implements SensorsRepository {
  final SensorsLocalDataSource sensorsLocalDataSource;
  final SensorsTrackLocalDataSource sensorsTrackLocalDataSource;

  SensorsRepositoryImpl({
    required this.sensorsLocalDataSource,
    required this.sensorsTrackLocalDataSource,
  });

  // Togliere la dipendenza da sensor_plus definendo una classe
  // proprietaria
  @override
  Stream<(SensorData, SensorData, SensorData, SensorData)> listenSensors() {
    return Rx.combineLatest4(
        sensorsLocalDataSource.listenAccelerometerSensors(),
        sensorsLocalDataSource.listenAccelerometerWithGravitySensors(),
        sensorsLocalDataSource.listenGyroscopeSensors(),
        sensorsLocalDataSource.listenMagnetometerSensors(),
        (acc, gravityAcc, gyro, magne) {
      return (acc, gravityAcc, gyro, magne);
    });
  }

  @override
  Future saveTrack(SensorTrack track) {
    return sensorsTrackLocalDataSource.saveTrack(track);
  }

  @override
  Stream<List<SensorTrack>> getSensorTracks() {
    return sensorsTrackLocalDataSource.getSensorTracks();
  }
}
