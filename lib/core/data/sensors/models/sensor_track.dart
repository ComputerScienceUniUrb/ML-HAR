import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:isar/isar.dart';

part 'sensor_track.g.dart';

@collection
class SensorTrack {
  SensorTrack({
    required this.sensorsData,
    required this.activityType,
    required this.smartphonePosition,
    required this.timestamp,
    required this.userInfo,
    required this.startBatteryLevel,
    required this.isInBatterySaveMode,
    required this.cloudId,
    required this.testDuration,
  });

  Id? id;

  final List<SensorsData>? sensorsData;
  @Enumerated(EnumType.name)
  final SensorActivityType? activityType;
  @Enumerated(EnumType.name)
  final SmartphonePosition? smartphonePosition;

  final DateTime? timestamp;

  final UserInfo? userInfo;

  final int? startBatteryLevel;
  final bool? isInBatterySaveMode;
  final String? cloudId;
  final int? testDuration;

  // factory SensorTrack.fromJson(Map<String, dynamic> json) {
  //   return SensorTrack(
  //     sensorsData: null,
  //     activityType: (json['activityType'] as String?) != null
  //         ? SensorActivityType.values.byName(json['activityType'] as String)
  //         : null,
  //     smartphonePosition: (json['smartphonePosition'] as String?) != null
  //         ? SmartphonePosition.values
  //         .byName(json['smartphonePosition'] as String)
  //         : null,
  //     timestamp: (json['timestamp'] as Timestamp?)?.toDate(),
  //     userInfo:
  //     json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null,
  //     startBatteryLevel: json['startBatteryLevel'] as int?,
  //     isInBatterySaveMode: json['isInBatterySaveMode'] as bool?,
  //     cloudId: json['cloudId'] as String?,
  //     testDuration: json['testDuration'] as int?,
  //   );
  // }

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
    );
  }
}

extension SensorTrackX on SensorTrack {
  bool get isUploaded => cloudId != null;
}

@embedded
class SensorsData {
  SensorData? accelerometer;
  SensorData? accelerometerWithGravity;
  SensorData? gyroscope;
  SensorData? magnetometer;
  String? activityRecognized;
  DateTime? timestamp;
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

@embedded
class SensorData {
  double? x;
  double? y;
  double? z;
  DateTime? timestamp;
}
