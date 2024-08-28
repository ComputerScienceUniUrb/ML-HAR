import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:isar/isar.dart';

part 'sensor_track.g.dart';

@collection
class SensorTrack {
  Id id = Isar.autoIncrement;

  List<SensorsData>? sensorsData;
  @Enumerated(EnumType.name)
  SensorActivityType? activityType;
  @Enumerated(EnumType.name)
  SmartphonePosition? smartphonePosition;

  DateTime? timestamp;
}

@embedded
class SensorsData {
  SensorData? accelerometer;
  SensorData? gyroscope;
  SensorData? magnetometer;
  String? activityRecognized;
  DateTime? timestamp;
}

extension SensorsDataCsv on SensorsData{
  List toCsvList() {
    return [
      timestamp,
      accelerometer?.x,
      accelerometer?.y,
      accelerometer?.z,
      accelerometer?.timestamp,
      gyroscope?.x,
      gyroscope?.y,
      gyroscope?.z,
      gyroscope?.timestamp,
      magnetometer?.x,
      magnetometer?.y,
      magnetometer?.z,
      magnetometer?.timestamp,
      activityRecognized,
    ];
  }
}


@embedded
class SensorData {
  double? x;
  double? y;
  double? z;
  DateTime? timestamp;
}

// @embedded
// class AccelerometerData {
//   double? x;
//   double? y;
//   double? z;
//   DateTime? timestamp;
// }
