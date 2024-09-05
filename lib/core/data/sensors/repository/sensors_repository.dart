import 'package:aifit/core/data/sensors/models/sensor_track.dart';

abstract class SensorsRepository {
  Stream<(SensorData, SensorData, SensorData, SensorData)> listenSensors();

  Future saveTrack(SensorTrack track);

  Stream<List<SensorTrack>> getSensorTracks();
}
