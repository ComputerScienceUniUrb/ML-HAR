import 'package:sensors_plus/sensors_plus.dart';

abstract class SensorsRepository{

  Stream<UserAccelerometerEvent> listenSensors();
}