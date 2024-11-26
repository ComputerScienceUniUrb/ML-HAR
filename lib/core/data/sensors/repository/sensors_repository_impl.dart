import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository.dart';
import 'package:aifit/core/data/sensors/sources/sensors_local_data_source.dart';
import 'package:aifit/core/data/sensors/sources/sensors_track_local_data_source.dart';
import 'package:aifit/core/data/sensors/sources/sensors_track_remote_data_source.dart';
import 'package:aifit/core/utils/csv_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import '';

part 'sensors_repository_impl.g.dart';

@riverpod
SensorsRepository getSensorsRepository(GetSensorsRepositoryRef ref) {
  return SensorsRepositoryImpl(
    deviceInfoPlugin: DeviceInfoPlugin(),
    sensorsLocalDataSource: ref.read(getSensorsLocalDataSourceProvider),
    sensorsTrackLocalDataSource:
        ref.read(getSensorsTrackLocalDataSourceProvider),
    sensorsTrackRemoteDataSource: ref.read(getSensorsRemoteDataSourceProvider),
  );
}

class SensorsRepositoryImpl implements SensorsRepository {
  final DeviceInfoPlugin deviceInfoPlugin;
  final SensorsLocalDataSource sensorsLocalDataSource;
  final SensorsTrackLocalDataSource sensorsTrackLocalDataSource;
  final SensorsTrackRemoteDataSource sensorsTrackRemoteDataSource;

  SensorsRepositoryImpl({
    required this.deviceInfoPlugin,
    required this.sensorsLocalDataSource,
    required this.sensorsTrackLocalDataSource,
    required this.sensorsTrackRemoteDataSource,
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
  Future<void> saveTrack(SensorTrack track) {
    return sensorsTrackLocalDataSource.saveTrack(track);
  }

  @override
  Stream<List<SensorTrack>> getSensorTracks() {
    return sensorsTrackLocalDataSource.getSensorTracks();
  }

  @override
  Future<void> uploadTrack(SensorTrack track) async {
    final docId = const Uuid().v4();
    final androidInfo = await deviceInfoPlugin.androidInfo;
    final csv = buildCsv(track, androidInfo);
    final downloadUrl =
    await sensorsTrackRemoteDataSource.uploadCsv(docId, csv);

    final trackWithCloudId = track.copyWith(cloudId: docId);
    await sensorsTrackRemoteDataSource
        .saveTrackOnFirestore(trackWithCloudId, downloadUrl);
    await sensorsTrackLocalDataSource.saveTrack(trackWithCloudId);
  }
}
