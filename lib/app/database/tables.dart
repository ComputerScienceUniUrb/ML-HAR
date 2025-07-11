import 'dart:convert';
import 'package:aifit/core/data/user/models/gender.dart';
import 'package:drift/drift.dart';

import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart' as legacy;

class SensorDataConverter extends TypeConverter<legacy.SensorData?, String?> {
  const SensorDataConverter();

  @override
  legacy.SensorData? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;
    final map = json.decode(fromDb) as Map<String, dynamic>;
    return legacy.SensorData(
      x: map['x'] as double?,
      y: map['y'] as double?,
      z: map['z'] as double?,
      timestamp: map['timestamp'] != null
          ? DateTime.tryParse(map['timestamp'] as String)
          : null,
    );
  }

  @override
  String? toSql(legacy.SensorData? value) {
    if (value == null) return null;
    return json.encode({
      'x': value.x,
      'y': value.y,
      'z': value.z,
      'timestamp': value.timestamp?.toIso8601String(),
    });
  }
}

class UserInfoConverter extends TypeConverter<UserInfo?, String?> {
  const UserInfoConverter();

  @override
  UserInfo? fromSql(String? fromDb) {
    if (fromDb == null || fromDb.isEmpty) return null;
    final map = json.decode(fromDb) as Map<String, dynamic>;
    return UserInfo.fromMap(map);
  }

  @override
  String? toSql(UserInfo? value) {
    if (value == null) return null;
    return json.encode(value.toMap());
  }
}

@DataClassName('SensorTrackData')
class SensorTracks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get activityType => text()
      .map(const EnumNameConverter(SensorActivityType.values))
      .nullable()();

  TextColumn get smartphonePosition => text()
      .map(const EnumNameConverter(SmartphonePosition.values))
      .nullable()();

  DateTimeColumn get timestamp => dateTime().nullable()();

  TextColumn get userInfo => text().map(const UserInfoConverter()).nullable()();

  IntColumn get startBatteryLevel => integer().nullable()();

  BoolColumn get isInBatterySaveMode => boolean().nullable()();

  TextColumn get cloudId => text().nullable()();

  IntColumn get testDuration => integer().nullable()();

  TextColumn get experimentId => text().nullable()();

  TextColumn get sessionId => text().nullable()();
}

@DataClassName('SensorsDataEntry')
class SensorsDataEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Chiave esterna per collegare ogni entry al suo SensorTrack
  IntColumn get trackId =>
      integer().references(SensorTracks, #id, onDelete: KeyAction.cascade)();

  TextColumn get accelerometer =>
      text().map(const SensorDataConverter()).nullable()();

  TextColumn get accelerometerWithGravity =>
      text().map(const SensorDataConverter()).nullable()();

  TextColumn get gyroscope =>
      text().map(const SensorDataConverter()).nullable()();

  TextColumn get magnetometer =>
      text().map(const SensorDataConverter()).nullable()();

  TextColumn get activityRecognized => text().nullable()();

  DateTimeColumn get timestamp => dateTime().nullable()();
}

@DataClassName('Session')
class Sessions extends Table {
  late final sessionId = text()();

  TextColumn get userId => text()();

  IntColumn get age => integer()();

  IntColumn get height => integer()();

  RealColumn get weight => real()();

  TextColumn get gender => textEnum<Gender>()();

  DateTimeColumn get addedOn => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {sessionId};
}

@DataClassName('WomTransaction')
class WomTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get womCount => integer()();

  TextColumn get womPin => text()();

  TextColumn get womLink => text()();

  TextColumn get otc => text().nullable()();

  DateTimeColumn get addedOn => dateTime()();
}

@DataClassName('WomReward')
class WomRewards extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get womCount => integer()();

  TextColumn get experimentId => text().nullable()();

  TextColumn get sessionId => text().nullable()();

  TextColumn get userId => text().nullable()();


  DateTimeColumn get addedOn => dateTime()();
}

