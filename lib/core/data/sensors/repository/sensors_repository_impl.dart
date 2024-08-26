import 'package:aifit/core/data/sensors/repository/sensors_repository.dart';
import 'package:aifit/core/data/sensors/sources/sensors_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'sensors_repository_impl.g.dart';

@riverpod
SensorsRepository getSensorsRepository(GetSensorsRepositoryRef ref) {
  return SensorsRepositoryImpl(
    sensorsLocalDataSource: ref.read(getSensorsLocalDataSourceProvider),
  );
}

class SensorsRepositoryImpl implements SensorsRepository {
  final SensorsLocalDataSource sensorsLocalDataSource;

  SensorsRepositoryImpl({required this.sensorsLocalDataSource});

  // Togliere la dipendenza da sensor_plus definendo una classe
  // proprietaria
  @override
  Stream<UserAccelerometerEvent> listenSensors() {
    return Stream.empty();
    return sensorsLocalDataSource.listenAccelerometerSensors();
  }
}
