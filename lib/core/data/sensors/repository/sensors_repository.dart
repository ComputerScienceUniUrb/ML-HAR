import 'package:aifit/core/data/sensors/models/sensor_track.dart';

abstract class SensorsRepository {

  void init();
  Stream<(SensorData, SensorData, SensorData?, SensorData)> listenSensors();

  Future<void> saveTrack(SensorTrack track);

  Stream<List<SensorTrack>> getSensorTracks();
  Future<void> uploadTrack(SensorTrack track);
}
