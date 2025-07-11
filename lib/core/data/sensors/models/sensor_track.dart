import 'package:aifit/app/database/database.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class SensorTrack {
  SensorTrack({
    required this.id,
    required this.sensorsData,
    required this.activityType,
    required this.smartphonePosition,
    required this.timestamp,
    required this.userInfo,
    required this.startBatteryLevel,
    required this.isInBatterySaveMode,
    required this.cloudId,
    required this.testDuration,
    required this.experimentId,
    required this.sessionId,
  });

  final String id;

  final List<SensorsData>? sensorsData;
  final SensorActivityType? activityType;
  final SmartphonePosition? smartphonePosition;

  final DateTime? timestamp;

  final UserInfo? userInfo;

  final int? startBatteryLevel;
  final bool? isInBatterySaveMode;
  final String? cloudId;
  final int? testDuration;
  final String? experimentId;
  final String? sessionId;

  factory SensorTrack.fromMap(Map<String, dynamic> json) {
    return SensorTrack(
      sensorsData: null,
      activityType: (json['activityType'] as String?) != null
          ? SensorActivityType.values.byName(json['activityType'] as String)
          : null,
      smartphonePosition: (json['smartphonePosition'] as String?) != null
          ? SmartphonePosition.values
              .byName(json['smartphonePosition'] as String)
          : null,
      timestamp: (json['timestamp'] as Timestamp?)?.toDate(),
      userInfo:
          json['userInfo'] != null ? UserInfo.fromMap(json['userInfo']) : null,
      startBatteryLevel: json['startBatteryLevel'] as int?,
      isInBatterySaveMode: json['isInBatterySaveMode'] as bool?,
      cloudId: json['cloudId'] as String?,
      testDuration: json['testDuration'] as int?,
      id: json['id'] as String,
      experimentId: json['experimentId'] as String?,
      sessionId: json['sessionId'] as String?,
    );
  }

  // Nuovo costruttore factory per Drift
  factory SensorTrack.fromDrift(
      SensorTrackData trackData, List<SensorsDataEntry> dataEntries) {
    return SensorTrack(
      id: trackData.id.toString(),
      // L'ID di Drift è int, lo convertiamo in String
      sensorsData: dataEntries
          .map((entry) => SensorsData.fromDriftEntry(entry))
          .toList(),
      activityType: trackData.activityType,
      smartphonePosition: trackData.smartphonePosition,
      timestamp: trackData.timestamp,
      userInfo: trackData.userInfo,
      startBatteryLevel: trackData.startBatteryLevel,
      isInBatterySaveMode: trackData.isInBatterySaveMode,
      cloudId: trackData.cloudId,
      testDuration: trackData.testDuration,
      experimentId: trackData.experimentId,
      sessionId: trackData.sessionId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activityType': activityType?.name,
      'smartphonePosition': smartphonePosition?.name,
      'timestamp': timestamp != null ? Timestamp.fromDate(timestamp!) : null,
      'userInfo': userInfo?.toMap(),
      'startBatteryLevel': startBatteryLevel,
      'isInBatterySaveMode': isInBatterySaveMode,
      'cloudId': cloudId,
      'testDuration': testDuration,
      'experimentId': experimentId,
      'sessionId': sessionId,
    };
  }

  SensorTrack copyWith({required String? cloudId}) {
    return SensorTrack(
      sensorsData: sensorsData,
      activityType: activityType,
      smartphonePosition: smartphonePosition,
      timestamp: timestamp,
      userInfo: userInfo,
      startBatteryLevel: startBatteryLevel,
      isInBatterySaveMode: isInBatterySaveMode,
      cloudId: cloudId ?? cloudId,
      testDuration: testDuration,
      experimentId: experimentId,
      sessionId: sessionId,
      id: id,
    );
  }
}

extension SensorTrackX on SensorTrack {
  bool get isUploaded => cloudId != null;
}

// @embedded
class SensorsData {
  final SensorData? accelerometer;
  final SensorData? accelerometerWithGravity;
  final SensorData? gyroscope;
  final SensorData? magnetometer;
  final String? activityRecognized;
  final DateTime? timestamp;

  SensorsData({
    required this.accelerometer,
    required this.accelerometerWithGravity,
    required this.gyroscope,
    required this.magnetometer,
    required this.activityRecognized,
    required this.timestamp,
  });

  factory SensorsData.fromDriftEntry(SensorsDataEntry entry) {
    return SensorsData(
      accelerometer: entry.accelerometer,
      accelerometerWithGravity: entry.accelerometerWithGravity,
      gyroscope: entry.gyroscope,
      magnetometer: entry.magnetometer,
      activityRecognized: entry.activityRecognized,
      timestamp: entry.timestamp,
    );
  }
}

extension SensorsDataCsv on SensorsData {
  List toCsvList() {
    return [
      timestamp,
      accelerometer?.x,
      accelerometer?.y,
      accelerometer?.z,
      accelerometer?.timestamp,
      accelerometerWithGravity?.x,
      accelerometerWithGravity?.y,
      accelerometerWithGravity?.z,
      accelerometerWithGravity?.timestamp,
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

  String valueFromColumnNumber(int column) {
    return toCsvList()[column].toString();
  }
}

class SensorData {
  final double? x;
  final double? y;
  final double? z;
  final DateTime? timestamp;

  SensorData({
    required this.x,
    required this.y,
    required this.z,
    required this.timestamp,
  });

  @override
  String toString() {
    return 'x: $x\n'
        'y: $y\n'
        'z: $z\n'
        'timestamp: $timestamp';
  }
}
