// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SensorTracksTable extends SensorTracks
    with TableInfo<$SensorTracksTable, SensorTrackData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SensorTracksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  late final GeneratedColumnWithTypeConverter<SensorActivityType?, String>
      activityType = GeneratedColumn<String>('activity_type', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<SensorActivityType?>(
              $SensorTracksTable.$converteractivityTypen);
  @override
  late final GeneratedColumnWithTypeConverter<SmartphonePosition?, String>
      smartphonePosition = GeneratedColumn<String>(
              'smartphone_position', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<SmartphonePosition?>(
              $SensorTracksTable.$convertersmartphonePositionn);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<UserInfo?, String> userInfo =
      GeneratedColumn<String>('user_info', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<UserInfo?>($SensorTracksTable.$converteruserInfo);
  static const VerificationMeta _startBatteryLevelMeta =
      const VerificationMeta('startBatteryLevel');
  @override
  late final GeneratedColumn<int> startBatteryLevel = GeneratedColumn<int>(
      'start_battery_level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isInBatterySaveModeMeta =
      const VerificationMeta('isInBatterySaveMode');
  @override
  late final GeneratedColumn<bool> isInBatterySaveMode = GeneratedColumn<bool>(
      'is_in_battery_save_mode', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_in_battery_save_mode" IN (0, 1))'));
  static const VerificationMeta _cloudIdMeta =
      const VerificationMeta('cloudId');
  @override
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
      'cloud_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _testDurationMeta =
      const VerificationMeta('testDuration');
  @override
  late final GeneratedColumn<int> testDuration = GeneratedColumn<int>(
      'test_duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _experimentIdMeta =
      const VerificationMeta('experimentId');
  @override
  late final GeneratedColumn<String> experimentId = GeneratedColumn<String>(
      'experiment_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        activityType,
        smartphonePosition,
        timestamp,
        userInfo,
        startBatteryLevel,
        isInBatterySaveMode,
        cloudId,
        testDuration,
        experimentId,
        sessionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sensor_tracks';
  @override
  VerificationContext validateIntegrity(Insertable<SensorTrackData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    if (data.containsKey('start_battery_level')) {
      context.handle(
          _startBatteryLevelMeta,
          startBatteryLevel.isAcceptableOrUnknown(
              data['start_battery_level']!, _startBatteryLevelMeta));
    }
    if (data.containsKey('is_in_battery_save_mode')) {
      context.handle(
          _isInBatterySaveModeMeta,
          isInBatterySaveMode.isAcceptableOrUnknown(
              data['is_in_battery_save_mode']!, _isInBatterySaveModeMeta));
    }
    if (data.containsKey('cloud_id')) {
      context.handle(_cloudIdMeta,
          cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta));
    }
    if (data.containsKey('test_duration')) {
      context.handle(
          _testDurationMeta,
          testDuration.isAcceptableOrUnknown(
              data['test_duration']!, _testDurationMeta));
    }
    if (data.containsKey('experiment_id')) {
      context.handle(
          _experimentIdMeta,
          experimentId.isAcceptableOrUnknown(
              data['experiment_id']!, _experimentIdMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SensorTrackData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SensorTrackData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      activityType: $SensorTracksTable.$converteractivityTypen.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}activity_type'])),
      smartphonePosition: $SensorTracksTable.$convertersmartphonePositionn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}smartphone_position'])),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp']),
      userInfo: $SensorTracksTable.$converteruserInfo.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_info'])),
      startBatteryLevel: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}start_battery_level']),
      isInBatterySaveMode: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_in_battery_save_mode']),
      cloudId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cloud_id']),
      testDuration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}test_duration']),
      experimentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}experiment_id']),
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id']),
    );
  }

  @override
  $SensorTracksTable createAlias(String alias) {
    return $SensorTracksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SensorActivityType, String, String>
      $converteractivityType =
      const EnumNameConverter(SensorActivityType.values);
  static JsonTypeConverter2<SensorActivityType?, String?, String?>
      $converteractivityTypen =
      JsonTypeConverter2.asNullable($converteractivityType);
  static JsonTypeConverter2<SmartphonePosition, String, String>
      $convertersmartphonePosition =
      const EnumNameConverter(SmartphonePosition.values);
  static JsonTypeConverter2<SmartphonePosition?, String?, String?>
      $convertersmartphonePositionn =
      JsonTypeConverter2.asNullable($convertersmartphonePosition);
  static TypeConverter<UserInfo?, String?> $converteruserInfo =
      const UserInfoConverter();
}

class SensorTrackData extends DataClass implements Insertable<SensorTrackData> {
  final int id;
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
  const SensorTrackData(
      {required this.id,
      this.activityType,
      this.smartphonePosition,
      this.timestamp,
      this.userInfo,
      this.startBatteryLevel,
      this.isInBatterySaveMode,
      this.cloudId,
      this.testDuration,
      this.experimentId,
      this.sessionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || activityType != null) {
      map['activity_type'] = Variable<String>(
          $SensorTracksTable.$converteractivityTypen.toSql(activityType));
    }
    if (!nullToAbsent || smartphonePosition != null) {
      map['smartphone_position'] = Variable<String>($SensorTracksTable
          .$convertersmartphonePositionn
          .toSql(smartphonePosition));
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    if (!nullToAbsent || userInfo != null) {
      map['user_info'] = Variable<String>(
          $SensorTracksTable.$converteruserInfo.toSql(userInfo));
    }
    if (!nullToAbsent || startBatteryLevel != null) {
      map['start_battery_level'] = Variable<int>(startBatteryLevel);
    }
    if (!nullToAbsent || isInBatterySaveMode != null) {
      map['is_in_battery_save_mode'] = Variable<bool>(isInBatterySaveMode);
    }
    if (!nullToAbsent || cloudId != null) {
      map['cloud_id'] = Variable<String>(cloudId);
    }
    if (!nullToAbsent || testDuration != null) {
      map['test_duration'] = Variable<int>(testDuration);
    }
    if (!nullToAbsent || experimentId != null) {
      map['experiment_id'] = Variable<String>(experimentId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    return map;
  }

  SensorTracksCompanion toCompanion(bool nullToAbsent) {
    return SensorTracksCompanion(
      id: Value(id),
      activityType: activityType == null && nullToAbsent
          ? const Value.absent()
          : Value(activityType),
      smartphonePosition: smartphonePosition == null && nullToAbsent
          ? const Value.absent()
          : Value(smartphonePosition),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      userInfo: userInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(userInfo),
      startBatteryLevel: startBatteryLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(startBatteryLevel),
      isInBatterySaveMode: isInBatterySaveMode == null && nullToAbsent
          ? const Value.absent()
          : Value(isInBatterySaveMode),
      cloudId: cloudId == null && nullToAbsent
          ? const Value.absent()
          : Value(cloudId),
      testDuration: testDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(testDuration),
      experimentId: experimentId == null && nullToAbsent
          ? const Value.absent()
          : Value(experimentId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
    );
  }

  factory SensorTrackData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SensorTrackData(
      id: serializer.fromJson<int>(json['id']),
      activityType: $SensorTracksTable.$converteractivityTypen
          .fromJson(serializer.fromJson<String?>(json['activityType'])),
      smartphonePosition: $SensorTracksTable.$convertersmartphonePositionn
          .fromJson(serializer.fromJson<String?>(json['smartphonePosition'])),
      timestamp: serializer.fromJson<DateTime?>(json['timestamp']),
      userInfo: serializer.fromJson<UserInfo?>(json['userInfo']),
      startBatteryLevel: serializer.fromJson<int?>(json['startBatteryLevel']),
      isInBatterySaveMode:
          serializer.fromJson<bool?>(json['isInBatterySaveMode']),
      cloudId: serializer.fromJson<String?>(json['cloudId']),
      testDuration: serializer.fromJson<int?>(json['testDuration']),
      experimentId: serializer.fromJson<String?>(json['experimentId']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityType': serializer.toJson<String?>(
          $SensorTracksTable.$converteractivityTypen.toJson(activityType)),
      'smartphonePosition': serializer.toJson<String?>($SensorTracksTable
          .$convertersmartphonePositionn
          .toJson(smartphonePosition)),
      'timestamp': serializer.toJson<DateTime?>(timestamp),
      'userInfo': serializer.toJson<UserInfo?>(userInfo),
      'startBatteryLevel': serializer.toJson<int?>(startBatteryLevel),
      'isInBatterySaveMode': serializer.toJson<bool?>(isInBatterySaveMode),
      'cloudId': serializer.toJson<String?>(cloudId),
      'testDuration': serializer.toJson<int?>(testDuration),
      'experimentId': serializer.toJson<String?>(experimentId),
      'sessionId': serializer.toJson<String?>(sessionId),
    };
  }

  SensorTrackData copyWith(
          {int? id,
          Value<SensorActivityType?> activityType = const Value.absent(),
          Value<SmartphonePosition?> smartphonePosition = const Value.absent(),
          Value<DateTime?> timestamp = const Value.absent(),
          Value<UserInfo?> userInfo = const Value.absent(),
          Value<int?> startBatteryLevel = const Value.absent(),
          Value<bool?> isInBatterySaveMode = const Value.absent(),
          Value<String?> cloudId = const Value.absent(),
          Value<int?> testDuration = const Value.absent(),
          Value<String?> experimentId = const Value.absent(),
          Value<String?> sessionId = const Value.absent()}) =>
      SensorTrackData(
        id: id ?? this.id,
        activityType:
            activityType.present ? activityType.value : this.activityType,
        smartphonePosition: smartphonePosition.present
            ? smartphonePosition.value
            : this.smartphonePosition,
        timestamp: timestamp.present ? timestamp.value : this.timestamp,
        userInfo: userInfo.present ? userInfo.value : this.userInfo,
        startBatteryLevel: startBatteryLevel.present
            ? startBatteryLevel.value
            : this.startBatteryLevel,
        isInBatterySaveMode: isInBatterySaveMode.present
            ? isInBatterySaveMode.value
            : this.isInBatterySaveMode,
        cloudId: cloudId.present ? cloudId.value : this.cloudId,
        testDuration:
            testDuration.present ? testDuration.value : this.testDuration,
        experimentId:
            experimentId.present ? experimentId.value : this.experimentId,
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
      );
  SensorTrackData copyWithCompanion(SensorTracksCompanion data) {
    return SensorTrackData(
      id: data.id.present ? data.id.value : this.id,
      activityType: data.activityType.present
          ? data.activityType.value
          : this.activityType,
      smartphonePosition: data.smartphonePosition.present
          ? data.smartphonePosition.value
          : this.smartphonePosition,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      userInfo: data.userInfo.present ? data.userInfo.value : this.userInfo,
      startBatteryLevel: data.startBatteryLevel.present
          ? data.startBatteryLevel.value
          : this.startBatteryLevel,
      isInBatterySaveMode: data.isInBatterySaveMode.present
          ? data.isInBatterySaveMode.value
          : this.isInBatterySaveMode,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      testDuration: data.testDuration.present
          ? data.testDuration.value
          : this.testDuration,
      experimentId: data.experimentId.present
          ? data.experimentId.value
          : this.experimentId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SensorTrackData(')
          ..write('id: $id, ')
          ..write('activityType: $activityType, ')
          ..write('smartphonePosition: $smartphonePosition, ')
          ..write('timestamp: $timestamp, ')
          ..write('userInfo: $userInfo, ')
          ..write('startBatteryLevel: $startBatteryLevel, ')
          ..write('isInBatterySaveMode: $isInBatterySaveMode, ')
          ..write('cloudId: $cloudId, ')
          ..write('testDuration: $testDuration, ')
          ..write('experimentId: $experimentId, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      activityType,
      smartphonePosition,
      timestamp,
      userInfo,
      startBatteryLevel,
      isInBatterySaveMode,
      cloudId,
      testDuration,
      experimentId,
      sessionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SensorTrackData &&
          other.id == this.id &&
          other.activityType == this.activityType &&
          other.smartphonePosition == this.smartphonePosition &&
          other.timestamp == this.timestamp &&
          other.userInfo == this.userInfo &&
          other.startBatteryLevel == this.startBatteryLevel &&
          other.isInBatterySaveMode == this.isInBatterySaveMode &&
          other.cloudId == this.cloudId &&
          other.testDuration == this.testDuration &&
          other.experimentId == this.experimentId &&
          other.sessionId == this.sessionId);
}

class SensorTracksCompanion extends UpdateCompanion<SensorTrackData> {
  final Value<int> id;
  final Value<SensorActivityType?> activityType;
  final Value<SmartphonePosition?> smartphonePosition;
  final Value<DateTime?> timestamp;
  final Value<UserInfo?> userInfo;
  final Value<int?> startBatteryLevel;
  final Value<bool?> isInBatterySaveMode;
  final Value<String?> cloudId;
  final Value<int?> testDuration;
  final Value<String?> experimentId;
  final Value<String?> sessionId;
  const SensorTracksCompanion({
    this.id = const Value.absent(),
    this.activityType = const Value.absent(),
    this.smartphonePosition = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.userInfo = const Value.absent(),
    this.startBatteryLevel = const Value.absent(),
    this.isInBatterySaveMode = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.testDuration = const Value.absent(),
    this.experimentId = const Value.absent(),
    this.sessionId = const Value.absent(),
  });
  SensorTracksCompanion.insert({
    this.id = const Value.absent(),
    this.activityType = const Value.absent(),
    this.smartphonePosition = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.userInfo = const Value.absent(),
    this.startBatteryLevel = const Value.absent(),
    this.isInBatterySaveMode = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.testDuration = const Value.absent(),
    this.experimentId = const Value.absent(),
    this.sessionId = const Value.absent(),
  });
  static Insertable<SensorTrackData> custom({
    Expression<int>? id,
    Expression<String>? activityType,
    Expression<String>? smartphonePosition,
    Expression<DateTime>? timestamp,
    Expression<String>? userInfo,
    Expression<int>? startBatteryLevel,
    Expression<bool>? isInBatterySaveMode,
    Expression<String>? cloudId,
    Expression<int>? testDuration,
    Expression<String>? experimentId,
    Expression<String>? sessionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activityType != null) 'activity_type': activityType,
      if (smartphonePosition != null) 'smartphone_position': smartphonePosition,
      if (timestamp != null) 'timestamp': timestamp,
      if (userInfo != null) 'user_info': userInfo,
      if (startBatteryLevel != null) 'start_battery_level': startBatteryLevel,
      if (isInBatterySaveMode != null)
        'is_in_battery_save_mode': isInBatterySaveMode,
      if (cloudId != null) 'cloud_id': cloudId,
      if (testDuration != null) 'test_duration': testDuration,
      if (experimentId != null) 'experiment_id': experimentId,
      if (sessionId != null) 'session_id': sessionId,
    });
  }

  SensorTracksCompanion copyWith(
      {Value<int>? id,
      Value<SensorActivityType?>? activityType,
      Value<SmartphonePosition?>? smartphonePosition,
      Value<DateTime?>? timestamp,
      Value<UserInfo?>? userInfo,
      Value<int?>? startBatteryLevel,
      Value<bool?>? isInBatterySaveMode,
      Value<String?>? cloudId,
      Value<int?>? testDuration,
      Value<String?>? experimentId,
      Value<String?>? sessionId}) {
    return SensorTracksCompanion(
      id: id ?? this.id,
      activityType: activityType ?? this.activityType,
      smartphonePosition: smartphonePosition ?? this.smartphonePosition,
      timestamp: timestamp ?? this.timestamp,
      userInfo: userInfo ?? this.userInfo,
      startBatteryLevel: startBatteryLevel ?? this.startBatteryLevel,
      isInBatterySaveMode: isInBatterySaveMode ?? this.isInBatterySaveMode,
      cloudId: cloudId ?? this.cloudId,
      testDuration: testDuration ?? this.testDuration,
      experimentId: experimentId ?? this.experimentId,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activityType.present) {
      map['activity_type'] = Variable<String>(
          $SensorTracksTable.$converteractivityTypen.toSql(activityType.value));
    }
    if (smartphonePosition.present) {
      map['smartphone_position'] = Variable<String>($SensorTracksTable
          .$convertersmartphonePositionn
          .toSql(smartphonePosition.value));
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (userInfo.present) {
      map['user_info'] = Variable<String>(
          $SensorTracksTable.$converteruserInfo.toSql(userInfo.value));
    }
    if (startBatteryLevel.present) {
      map['start_battery_level'] = Variable<int>(startBatteryLevel.value);
    }
    if (isInBatterySaveMode.present) {
      map['is_in_battery_save_mode'] =
          Variable<bool>(isInBatterySaveMode.value);
    }
    if (cloudId.present) {
      map['cloud_id'] = Variable<String>(cloudId.value);
    }
    if (testDuration.present) {
      map['test_duration'] = Variable<int>(testDuration.value);
    }
    if (experimentId.present) {
      map['experiment_id'] = Variable<String>(experimentId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SensorTracksCompanion(')
          ..write('id: $id, ')
          ..write('activityType: $activityType, ')
          ..write('smartphonePosition: $smartphonePosition, ')
          ..write('timestamp: $timestamp, ')
          ..write('userInfo: $userInfo, ')
          ..write('startBatteryLevel: $startBatteryLevel, ')
          ..write('isInBatterySaveMode: $isInBatterySaveMode, ')
          ..write('cloudId: $cloudId, ')
          ..write('testDuration: $testDuration, ')
          ..write('experimentId: $experimentId, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }
}

class $SensorsDataEntriesTable extends SensorsDataEntries
    with TableInfo<$SensorsDataEntriesTable, SensorsDataEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SensorsDataEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trackIdMeta =
      const VerificationMeta('trackId');
  @override
  late final GeneratedColumn<int> trackId = GeneratedColumn<int>(
      'track_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sensor_tracks (id) ON DELETE CASCADE'));
  @override
  late final GeneratedColumnWithTypeConverter<legacy.SensorData?, String>
      accelerometer = GeneratedColumn<String>(
              'accelerometer', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<legacy.SensorData?>(
              $SensorsDataEntriesTable.$converteraccelerometer);
  @override
  late final GeneratedColumnWithTypeConverter<legacy.SensorData?, String>
      accelerometerWithGravity = GeneratedColumn<String>(
              'accelerometer_with_gravity', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<legacy.SensorData?>(
              $SensorsDataEntriesTable.$converteraccelerometerWithGravity);
  @override
  late final GeneratedColumnWithTypeConverter<legacy.SensorData?, String>
      gyroscope = GeneratedColumn<String>('gyroscope', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<legacy.SensorData?>(
              $SensorsDataEntriesTable.$convertergyroscope);
  @override
  late final GeneratedColumnWithTypeConverter<legacy.SensorData?, String>
      magnetometer = GeneratedColumn<String>('magnetometer', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<legacy.SensorData?>(
              $SensorsDataEntriesTable.$convertermagnetometer);
  static const VerificationMeta _activityRecognizedMeta =
      const VerificationMeta('activityRecognized');
  @override
  late final GeneratedColumn<String> activityRecognized =
      GeneratedColumn<String>('activity_recognized', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        trackId,
        accelerometer,
        accelerometerWithGravity,
        gyroscope,
        magnetometer,
        activityRecognized,
        timestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sensors_data_entries';
  @override
  VerificationContext validateIntegrity(Insertable<SensorsDataEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('track_id')) {
      context.handle(_trackIdMeta,
          trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta));
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('activity_recognized')) {
      context.handle(
          _activityRecognizedMeta,
          activityRecognized.isAcceptableOrUnknown(
              data['activity_recognized']!, _activityRecognizedMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SensorsDataEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SensorsDataEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      trackId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}track_id'])!,
      accelerometer: $SensorsDataEntriesTable.$converteraccelerometer.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}accelerometer'])),
      accelerometerWithGravity: $SensorsDataEntriesTable
          .$converteraccelerometerWithGravity
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}accelerometer_with_gravity'])),
      gyroscope: $SensorsDataEntriesTable.$convertergyroscope.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}gyroscope'])),
      magnetometer: $SensorsDataEntriesTable.$convertermagnetometer.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}magnetometer'])),
      activityRecognized: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}activity_recognized']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp']),
    );
  }

  @override
  $SensorsDataEntriesTable createAlias(String alias) {
    return $SensorsDataEntriesTable(attachedDatabase, alias);
  }

  static TypeConverter<legacy.SensorData?, String?> $converteraccelerometer =
      const SensorDataConverter();
  static TypeConverter<legacy.SensorData?, String?>
      $converteraccelerometerWithGravity = const SensorDataConverter();
  static TypeConverter<legacy.SensorData?, String?> $convertergyroscope =
      const SensorDataConverter();
  static TypeConverter<legacy.SensorData?, String?> $convertermagnetometer =
      const SensorDataConverter();
}

class SensorsDataEntry extends DataClass
    implements Insertable<SensorsDataEntry> {
  final int id;
  final int trackId;
  final legacy.SensorData? accelerometer;
  final legacy.SensorData? accelerometerWithGravity;
  final legacy.SensorData? gyroscope;
  final legacy.SensorData? magnetometer;
  final String? activityRecognized;
  final DateTime? timestamp;
  const SensorsDataEntry(
      {required this.id,
      required this.trackId,
      this.accelerometer,
      this.accelerometerWithGravity,
      this.gyroscope,
      this.magnetometer,
      this.activityRecognized,
      this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['track_id'] = Variable<int>(trackId);
    if (!nullToAbsent || accelerometer != null) {
      map['accelerometer'] = Variable<String>($SensorsDataEntriesTable
          .$converteraccelerometer
          .toSql(accelerometer));
    }
    if (!nullToAbsent || accelerometerWithGravity != null) {
      map['accelerometer_with_gravity'] = Variable<String>(
          $SensorsDataEntriesTable.$converteraccelerometerWithGravity
              .toSql(accelerometerWithGravity));
    }
    if (!nullToAbsent || gyroscope != null) {
      map['gyroscope'] = Variable<String>(
          $SensorsDataEntriesTable.$convertergyroscope.toSql(gyroscope));
    }
    if (!nullToAbsent || magnetometer != null) {
      map['magnetometer'] = Variable<String>(
          $SensorsDataEntriesTable.$convertermagnetometer.toSql(magnetometer));
    }
    if (!nullToAbsent || activityRecognized != null) {
      map['activity_recognized'] = Variable<String>(activityRecognized);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime>(timestamp);
    }
    return map;
  }

  SensorsDataEntriesCompanion toCompanion(bool nullToAbsent) {
    return SensorsDataEntriesCompanion(
      id: Value(id),
      trackId: Value(trackId),
      accelerometer: accelerometer == null && nullToAbsent
          ? const Value.absent()
          : Value(accelerometer),
      accelerometerWithGravity: accelerometerWithGravity == null && nullToAbsent
          ? const Value.absent()
          : Value(accelerometerWithGravity),
      gyroscope: gyroscope == null && nullToAbsent
          ? const Value.absent()
          : Value(gyroscope),
      magnetometer: magnetometer == null && nullToAbsent
          ? const Value.absent()
          : Value(magnetometer),
      activityRecognized: activityRecognized == null && nullToAbsent
          ? const Value.absent()
          : Value(activityRecognized),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
    );
  }

  factory SensorsDataEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SensorsDataEntry(
      id: serializer.fromJson<int>(json['id']),
      trackId: serializer.fromJson<int>(json['trackId']),
      accelerometer:
          serializer.fromJson<legacy.SensorData?>(json['accelerometer']),
      accelerometerWithGravity: serializer
          .fromJson<legacy.SensorData?>(json['accelerometerWithGravity']),
      gyroscope: serializer.fromJson<legacy.SensorData?>(json['gyroscope']),
      magnetometer:
          serializer.fromJson<legacy.SensorData?>(json['magnetometer']),
      activityRecognized:
          serializer.fromJson<String?>(json['activityRecognized']),
      timestamp: serializer.fromJson<DateTime?>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trackId': serializer.toJson<int>(trackId),
      'accelerometer': serializer.toJson<legacy.SensorData?>(accelerometer),
      'accelerometerWithGravity':
          serializer.toJson<legacy.SensorData?>(accelerometerWithGravity),
      'gyroscope': serializer.toJson<legacy.SensorData?>(gyroscope),
      'magnetometer': serializer.toJson<legacy.SensorData?>(magnetometer),
      'activityRecognized': serializer.toJson<String?>(activityRecognized),
      'timestamp': serializer.toJson<DateTime?>(timestamp),
    };
  }

  SensorsDataEntry copyWith(
          {int? id,
          int? trackId,
          Value<legacy.SensorData?> accelerometer = const Value.absent(),
          Value<legacy.SensorData?> accelerometerWithGravity =
              const Value.absent(),
          Value<legacy.SensorData?> gyroscope = const Value.absent(),
          Value<legacy.SensorData?> magnetometer = const Value.absent(),
          Value<String?> activityRecognized = const Value.absent(),
          Value<DateTime?> timestamp = const Value.absent()}) =>
      SensorsDataEntry(
        id: id ?? this.id,
        trackId: trackId ?? this.trackId,
        accelerometer:
            accelerometer.present ? accelerometer.value : this.accelerometer,
        accelerometerWithGravity: accelerometerWithGravity.present
            ? accelerometerWithGravity.value
            : this.accelerometerWithGravity,
        gyroscope: gyroscope.present ? gyroscope.value : this.gyroscope,
        magnetometer:
            magnetometer.present ? magnetometer.value : this.magnetometer,
        activityRecognized: activityRecognized.present
            ? activityRecognized.value
            : this.activityRecognized,
        timestamp: timestamp.present ? timestamp.value : this.timestamp,
      );
  SensorsDataEntry copyWithCompanion(SensorsDataEntriesCompanion data) {
    return SensorsDataEntry(
      id: data.id.present ? data.id.value : this.id,
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      accelerometer: data.accelerometer.present
          ? data.accelerometer.value
          : this.accelerometer,
      accelerometerWithGravity: data.accelerometerWithGravity.present
          ? data.accelerometerWithGravity.value
          : this.accelerometerWithGravity,
      gyroscope: data.gyroscope.present ? data.gyroscope.value : this.gyroscope,
      magnetometer: data.magnetometer.present
          ? data.magnetometer.value
          : this.magnetometer,
      activityRecognized: data.activityRecognized.present
          ? data.activityRecognized.value
          : this.activityRecognized,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SensorsDataEntry(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('accelerometer: $accelerometer, ')
          ..write('accelerometerWithGravity: $accelerometerWithGravity, ')
          ..write('gyroscope: $gyroscope, ')
          ..write('magnetometer: $magnetometer, ')
          ..write('activityRecognized: $activityRecognized, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      trackId,
      accelerometer,
      accelerometerWithGravity,
      gyroscope,
      magnetometer,
      activityRecognized,
      timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SensorsDataEntry &&
          other.id == this.id &&
          other.trackId == this.trackId &&
          other.accelerometer == this.accelerometer &&
          other.accelerometerWithGravity == this.accelerometerWithGravity &&
          other.gyroscope == this.gyroscope &&
          other.magnetometer == this.magnetometer &&
          other.activityRecognized == this.activityRecognized &&
          other.timestamp == this.timestamp);
}

class SensorsDataEntriesCompanion extends UpdateCompanion<SensorsDataEntry> {
  final Value<int> id;
  final Value<int> trackId;
  final Value<legacy.SensorData?> accelerometer;
  final Value<legacy.SensorData?> accelerometerWithGravity;
  final Value<legacy.SensorData?> gyroscope;
  final Value<legacy.SensorData?> magnetometer;
  final Value<String?> activityRecognized;
  final Value<DateTime?> timestamp;
  const SensorsDataEntriesCompanion({
    this.id = const Value.absent(),
    this.trackId = const Value.absent(),
    this.accelerometer = const Value.absent(),
    this.accelerometerWithGravity = const Value.absent(),
    this.gyroscope = const Value.absent(),
    this.magnetometer = const Value.absent(),
    this.activityRecognized = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  SensorsDataEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int trackId,
    this.accelerometer = const Value.absent(),
    this.accelerometerWithGravity = const Value.absent(),
    this.gyroscope = const Value.absent(),
    this.magnetometer = const Value.absent(),
    this.activityRecognized = const Value.absent(),
    this.timestamp = const Value.absent(),
  }) : trackId = Value(trackId);
  static Insertable<SensorsDataEntry> custom({
    Expression<int>? id,
    Expression<int>? trackId,
    Expression<String>? accelerometer,
    Expression<String>? accelerometerWithGravity,
    Expression<String>? gyroscope,
    Expression<String>? magnetometer,
    Expression<String>? activityRecognized,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackId != null) 'track_id': trackId,
      if (accelerometer != null) 'accelerometer': accelerometer,
      if (accelerometerWithGravity != null)
        'accelerometer_with_gravity': accelerometerWithGravity,
      if (gyroscope != null) 'gyroscope': gyroscope,
      if (magnetometer != null) 'magnetometer': magnetometer,
      if (activityRecognized != null) 'activity_recognized': activityRecognized,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  SensorsDataEntriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? trackId,
      Value<legacy.SensorData?>? accelerometer,
      Value<legacy.SensorData?>? accelerometerWithGravity,
      Value<legacy.SensorData?>? gyroscope,
      Value<legacy.SensorData?>? magnetometer,
      Value<String?>? activityRecognized,
      Value<DateTime?>? timestamp}) {
    return SensorsDataEntriesCompanion(
      id: id ?? this.id,
      trackId: trackId ?? this.trackId,
      accelerometer: accelerometer ?? this.accelerometer,
      accelerometerWithGravity:
          accelerometerWithGravity ?? this.accelerometerWithGravity,
      gyroscope: gyroscope ?? this.gyroscope,
      magnetometer: magnetometer ?? this.magnetometer,
      activityRecognized: activityRecognized ?? this.activityRecognized,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trackId.present) {
      map['track_id'] = Variable<int>(trackId.value);
    }
    if (accelerometer.present) {
      map['accelerometer'] = Variable<String>($SensorsDataEntriesTable
          .$converteraccelerometer
          .toSql(accelerometer.value));
    }
    if (accelerometerWithGravity.present) {
      map['accelerometer_with_gravity'] = Variable<String>(
          $SensorsDataEntriesTable.$converteraccelerometerWithGravity
              .toSql(accelerometerWithGravity.value));
    }
    if (gyroscope.present) {
      map['gyroscope'] = Variable<String>(
          $SensorsDataEntriesTable.$convertergyroscope.toSql(gyroscope.value));
    }
    if (magnetometer.present) {
      map['magnetometer'] = Variable<String>($SensorsDataEntriesTable
          .$convertermagnetometer
          .toSql(magnetometer.value));
    }
    if (activityRecognized.present) {
      map['activity_recognized'] = Variable<String>(activityRecognized.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SensorsDataEntriesCompanion(')
          ..write('id: $id, ')
          ..write('trackId: $trackId, ')
          ..write('accelerometer: $accelerometer, ')
          ..write('accelerometerWithGravity: $accelerometerWithGravity, ')
          ..write('gyroscope: $gyroscope, ')
          ..write('magnetometer: $magnetometer, ')
          ..write('activityRecognized: $activityRecognized, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Gender, String> gender =
      GeneratedColumn<String>('gender', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Gender>($SessionsTable.$convertergender);
  static const VerificationMeta _addedOnMeta =
      const VerificationMeta('addedOn');
  @override
  late final GeneratedColumn<DateTime> addedOn = GeneratedColumn<DateTime>(
      'added_on', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [sessionId, userId, age, height, weight, gender, addedOn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(Insertable<Session> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('added_on')) {
      context.handle(_addedOnMeta,
          addedOn.isAcceptableOrUnknown(data['added_on']!, _addedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      gender: $SessionsTable.$convertergender.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!),
      addedOn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_on']),
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Gender, String, String> $convertergender =
      const EnumNameConverter<Gender>(Gender.values);
}

class Session extends DataClass implements Insertable<Session> {
  final String sessionId;
  final String userId;
  final int age;
  final int height;
  final double weight;
  final Gender gender;
  final DateTime? addedOn;
  const Session(
      {required this.sessionId,
      required this.userId,
      required this.age,
      required this.height,
      required this.weight,
      required this.gender,
      this.addedOn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    map['user_id'] = Variable<String>(userId);
    map['age'] = Variable<int>(age);
    map['height'] = Variable<int>(height);
    map['weight'] = Variable<double>(weight);
    {
      map['gender'] =
          Variable<String>($SessionsTable.$convertergender.toSql(gender));
    }
    if (!nullToAbsent || addedOn != null) {
      map['added_on'] = Variable<DateTime>(addedOn);
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      sessionId: Value(sessionId),
      userId: Value(userId),
      age: Value(age),
      height: Value(height),
      weight: Value(weight),
      gender: Value(gender),
      addedOn: addedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(addedOn),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      sessionId: serializer.fromJson<String>(json['sessionId']),
      userId: serializer.fromJson<String>(json['userId']),
      age: serializer.fromJson<int>(json['age']),
      height: serializer.fromJson<int>(json['height']),
      weight: serializer.fromJson<double>(json['weight']),
      gender: $SessionsTable.$convertergender
          .fromJson(serializer.fromJson<String>(json['gender'])),
      addedOn: serializer.fromJson<DateTime?>(json['addedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<String>(sessionId),
      'userId': serializer.toJson<String>(userId),
      'age': serializer.toJson<int>(age),
      'height': serializer.toJson<int>(height),
      'weight': serializer.toJson<double>(weight),
      'gender': serializer
          .toJson<String>($SessionsTable.$convertergender.toJson(gender)),
      'addedOn': serializer.toJson<DateTime?>(addedOn),
    };
  }

  Session copyWith(
          {String? sessionId,
          String? userId,
          int? age,
          int? height,
          double? weight,
          Gender? gender,
          Value<DateTime?> addedOn = const Value.absent()}) =>
      Session(
        sessionId: sessionId ?? this.sessionId,
        userId: userId ?? this.userId,
        age: age ?? this.age,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        gender: gender ?? this.gender,
        addedOn: addedOn.present ? addedOn.value : this.addedOn,
      );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      userId: data.userId.present ? data.userId.value : this.userId,
      age: data.age.present ? data.age.value : this.age,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      gender: data.gender.present ? data.gender.value : this.gender,
      addedOn: data.addedOn.present ? data.addedOn.value : this.addedOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('gender: $gender, ')
          ..write('addedOn: $addedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(sessionId, userId, age, height, weight, gender, addedOn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.sessionId == this.sessionId &&
          other.userId == this.userId &&
          other.age == this.age &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.gender == this.gender &&
          other.addedOn == this.addedOn);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<String> sessionId;
  final Value<String> userId;
  final Value<int> age;
  final Value<int> height;
  final Value<double> weight;
  final Value<Gender> gender;
  final Value<DateTime?> addedOn;
  final Value<int> rowid;
  const SessionsCompanion({
    this.sessionId = const Value.absent(),
    this.userId = const Value.absent(),
    this.age = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.gender = const Value.absent(),
    this.addedOn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String sessionId,
    required String userId,
    required int age,
    required int height,
    required double weight,
    required Gender gender,
    this.addedOn = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : sessionId = Value(sessionId),
        userId = Value(userId),
        age = Value(age),
        height = Value(height),
        weight = Value(weight),
        gender = Value(gender);
  static Insertable<Session> custom({
    Expression<String>? sessionId,
    Expression<String>? userId,
    Expression<int>? age,
    Expression<int>? height,
    Expression<double>? weight,
    Expression<String>? gender,
    Expression<DateTime>? addedOn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (userId != null) 'user_id': userId,
      if (age != null) 'age': age,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (gender != null) 'gender': gender,
      if (addedOn != null) 'added_on': addedOn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith(
      {Value<String>? sessionId,
      Value<String>? userId,
      Value<int>? age,
      Value<int>? height,
      Value<double>? weight,
      Value<Gender>? gender,
      Value<DateTime?>? addedOn,
      Value<int>? rowid}) {
    return SessionsCompanion(
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      addedOn: addedOn ?? this.addedOn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (gender.present) {
      map['gender'] =
          Variable<String>($SessionsTable.$convertergender.toSql(gender.value));
    }
    if (addedOn.present) {
      map['added_on'] = Variable<DateTime>(addedOn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('gender: $gender, ')
          ..write('addedOn: $addedOn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WomTransactionsTable extends WomTransactions
    with TableInfo<$WomTransactionsTable, WomTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WomTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _womCountMeta =
      const VerificationMeta('womCount');
  @override
  late final GeneratedColumn<int> womCount = GeneratedColumn<int>(
      'wom_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _womPinMeta = const VerificationMeta('womPin');
  @override
  late final GeneratedColumn<String> womPin = GeneratedColumn<String>(
      'wom_pin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _womLinkMeta =
      const VerificationMeta('womLink');
  @override
  late final GeneratedColumn<String> womLink = GeneratedColumn<String>(
      'wom_link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _otcMeta = const VerificationMeta('otc');
  @override
  late final GeneratedColumn<String> otc = GeneratedColumn<String>(
      'otc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addedOnMeta =
      const VerificationMeta('addedOn');
  @override
  late final GeneratedColumn<DateTime> addedOn = GeneratedColumn<DateTime>(
      'added_on', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, womCount, womPin, womLink, otc, addedOn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wom_transactions';
  @override
  VerificationContext validateIntegrity(Insertable<WomTransaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wom_count')) {
      context.handle(_womCountMeta,
          womCount.isAcceptableOrUnknown(data['wom_count']!, _womCountMeta));
    } else if (isInserting) {
      context.missing(_womCountMeta);
    }
    if (data.containsKey('wom_pin')) {
      context.handle(_womPinMeta,
          womPin.isAcceptableOrUnknown(data['wom_pin']!, _womPinMeta));
    } else if (isInserting) {
      context.missing(_womPinMeta);
    }
    if (data.containsKey('wom_link')) {
      context.handle(_womLinkMeta,
          womLink.isAcceptableOrUnknown(data['wom_link']!, _womLinkMeta));
    } else if (isInserting) {
      context.missing(_womLinkMeta);
    }
    if (data.containsKey('otc')) {
      context.handle(
          _otcMeta, otc.isAcceptableOrUnknown(data['otc']!, _otcMeta));
    }
    if (data.containsKey('added_on')) {
      context.handle(_addedOnMeta,
          addedOn.isAcceptableOrUnknown(data['added_on']!, _addedOnMeta));
    } else if (isInserting) {
      context.missing(_addedOnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WomTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WomTransaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      womCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wom_count'])!,
      womPin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wom_pin'])!,
      womLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wom_link'])!,
      otc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}otc']),
      addedOn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_on'])!,
    );
  }

  @override
  $WomTransactionsTable createAlias(String alias) {
    return $WomTransactionsTable(attachedDatabase, alias);
  }
}

class WomTransaction extends DataClass implements Insertable<WomTransaction> {
  final int id;
  final int womCount;
  final String womPin;
  final String womLink;
  final String? otc;
  final DateTime addedOn;
  const WomTransaction(
      {required this.id,
      required this.womCount,
      required this.womPin,
      required this.womLink,
      this.otc,
      required this.addedOn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wom_count'] = Variable<int>(womCount);
    map['wom_pin'] = Variable<String>(womPin);
    map['wom_link'] = Variable<String>(womLink);
    if (!nullToAbsent || otc != null) {
      map['otc'] = Variable<String>(otc);
    }
    map['added_on'] = Variable<DateTime>(addedOn);
    return map;
  }

  WomTransactionsCompanion toCompanion(bool nullToAbsent) {
    return WomTransactionsCompanion(
      id: Value(id),
      womCount: Value(womCount),
      womPin: Value(womPin),
      womLink: Value(womLink),
      otc: otc == null && nullToAbsent ? const Value.absent() : Value(otc),
      addedOn: Value(addedOn),
    );
  }

  factory WomTransaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WomTransaction(
      id: serializer.fromJson<int>(json['id']),
      womCount: serializer.fromJson<int>(json['womCount']),
      womPin: serializer.fromJson<String>(json['womPin']),
      womLink: serializer.fromJson<String>(json['womLink']),
      otc: serializer.fromJson<String?>(json['otc']),
      addedOn: serializer.fromJson<DateTime>(json['addedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'womCount': serializer.toJson<int>(womCount),
      'womPin': serializer.toJson<String>(womPin),
      'womLink': serializer.toJson<String>(womLink),
      'otc': serializer.toJson<String?>(otc),
      'addedOn': serializer.toJson<DateTime>(addedOn),
    };
  }

  WomTransaction copyWith(
          {int? id,
          int? womCount,
          String? womPin,
          String? womLink,
          Value<String?> otc = const Value.absent(),
          DateTime? addedOn}) =>
      WomTransaction(
        id: id ?? this.id,
        womCount: womCount ?? this.womCount,
        womPin: womPin ?? this.womPin,
        womLink: womLink ?? this.womLink,
        otc: otc.present ? otc.value : this.otc,
        addedOn: addedOn ?? this.addedOn,
      );
  WomTransaction copyWithCompanion(WomTransactionsCompanion data) {
    return WomTransaction(
      id: data.id.present ? data.id.value : this.id,
      womCount: data.womCount.present ? data.womCount.value : this.womCount,
      womPin: data.womPin.present ? data.womPin.value : this.womPin,
      womLink: data.womLink.present ? data.womLink.value : this.womLink,
      otc: data.otc.present ? data.otc.value : this.otc,
      addedOn: data.addedOn.present ? data.addedOn.value : this.addedOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WomTransaction(')
          ..write('id: $id, ')
          ..write('womCount: $womCount, ')
          ..write('womPin: $womPin, ')
          ..write('womLink: $womLink, ')
          ..write('otc: $otc, ')
          ..write('addedOn: $addedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, womCount, womPin, womLink, otc, addedOn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WomTransaction &&
          other.id == this.id &&
          other.womCount == this.womCount &&
          other.womPin == this.womPin &&
          other.womLink == this.womLink &&
          other.otc == this.otc &&
          other.addedOn == this.addedOn);
}

class WomTransactionsCompanion extends UpdateCompanion<WomTransaction> {
  final Value<int> id;
  final Value<int> womCount;
  final Value<String> womPin;
  final Value<String> womLink;
  final Value<String?> otc;
  final Value<DateTime> addedOn;
  const WomTransactionsCompanion({
    this.id = const Value.absent(),
    this.womCount = const Value.absent(),
    this.womPin = const Value.absent(),
    this.womLink = const Value.absent(),
    this.otc = const Value.absent(),
    this.addedOn = const Value.absent(),
  });
  WomTransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int womCount,
    required String womPin,
    required String womLink,
    this.otc = const Value.absent(),
    required DateTime addedOn,
  })  : womCount = Value(womCount),
        womPin = Value(womPin),
        womLink = Value(womLink),
        addedOn = Value(addedOn);
  static Insertable<WomTransaction> custom({
    Expression<int>? id,
    Expression<int>? womCount,
    Expression<String>? womPin,
    Expression<String>? womLink,
    Expression<String>? otc,
    Expression<DateTime>? addedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (womCount != null) 'wom_count': womCount,
      if (womPin != null) 'wom_pin': womPin,
      if (womLink != null) 'wom_link': womLink,
      if (otc != null) 'otc': otc,
      if (addedOn != null) 'added_on': addedOn,
    });
  }

  WomTransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? womCount,
      Value<String>? womPin,
      Value<String>? womLink,
      Value<String?>? otc,
      Value<DateTime>? addedOn}) {
    return WomTransactionsCompanion(
      id: id ?? this.id,
      womCount: womCount ?? this.womCount,
      womPin: womPin ?? this.womPin,
      womLink: womLink ?? this.womLink,
      otc: otc ?? this.otc,
      addedOn: addedOn ?? this.addedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (womCount.present) {
      map['wom_count'] = Variable<int>(womCount.value);
    }
    if (womPin.present) {
      map['wom_pin'] = Variable<String>(womPin.value);
    }
    if (womLink.present) {
      map['wom_link'] = Variable<String>(womLink.value);
    }
    if (otc.present) {
      map['otc'] = Variable<String>(otc.value);
    }
    if (addedOn.present) {
      map['added_on'] = Variable<DateTime>(addedOn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WomTransactionsCompanion(')
          ..write('id: $id, ')
          ..write('womCount: $womCount, ')
          ..write('womPin: $womPin, ')
          ..write('womLink: $womLink, ')
          ..write('otc: $otc, ')
          ..write('addedOn: $addedOn')
          ..write(')'))
        .toString();
  }
}

class $WomRewardsTable extends WomRewards
    with TableInfo<$WomRewardsTable, WomReward> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WomRewardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _womCountMeta =
      const VerificationMeta('womCount');
  @override
  late final GeneratedColumn<int> womCount = GeneratedColumn<int>(
      'wom_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _experimentIdMeta =
      const VerificationMeta('experimentId');
  @override
  late final GeneratedColumn<String> experimentId = GeneratedColumn<String>(
      'experiment_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addedOnMeta =
      const VerificationMeta('addedOn');
  @override
  late final GeneratedColumn<DateTime> addedOn = GeneratedColumn<DateTime>(
      'added_on', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, womCount, experimentId, sessionId, userId, addedOn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wom_rewards';
  @override
  VerificationContext validateIntegrity(Insertable<WomReward> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wom_count')) {
      context.handle(_womCountMeta,
          womCount.isAcceptableOrUnknown(data['wom_count']!, _womCountMeta));
    } else if (isInserting) {
      context.missing(_womCountMeta);
    }
    if (data.containsKey('experiment_id')) {
      context.handle(
          _experimentIdMeta,
          experimentId.isAcceptableOrUnknown(
              data['experiment_id']!, _experimentIdMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('added_on')) {
      context.handle(_addedOnMeta,
          addedOn.isAcceptableOrUnknown(data['added_on']!, _addedOnMeta));
    } else if (isInserting) {
      context.missing(_addedOnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WomReward map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WomReward(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      womCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wom_count'])!,
      experimentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}experiment_id']),
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id']),
      addedOn: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_on'])!,
    );
  }

  @override
  $WomRewardsTable createAlias(String alias) {
    return $WomRewardsTable(attachedDatabase, alias);
  }
}

class WomReward extends DataClass implements Insertable<WomReward> {
  final int id;
  final int womCount;
  final String? experimentId;
  final String? sessionId;
  final String? userId;
  final DateTime addedOn;
  const WomReward(
      {required this.id,
      required this.womCount,
      this.experimentId,
      this.sessionId,
      this.userId,
      required this.addedOn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wom_count'] = Variable<int>(womCount);
    if (!nullToAbsent || experimentId != null) {
      map['experiment_id'] = Variable<String>(experimentId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['added_on'] = Variable<DateTime>(addedOn);
    return map;
  }

  WomRewardsCompanion toCompanion(bool nullToAbsent) {
    return WomRewardsCompanion(
      id: Value(id),
      womCount: Value(womCount),
      experimentId: experimentId == null && nullToAbsent
          ? const Value.absent()
          : Value(experimentId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      addedOn: Value(addedOn),
    );
  }

  factory WomReward.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WomReward(
      id: serializer.fromJson<int>(json['id']),
      womCount: serializer.fromJson<int>(json['womCount']),
      experimentId: serializer.fromJson<String?>(json['experimentId']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      userId: serializer.fromJson<String?>(json['userId']),
      addedOn: serializer.fromJson<DateTime>(json['addedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'womCount': serializer.toJson<int>(womCount),
      'experimentId': serializer.toJson<String?>(experimentId),
      'sessionId': serializer.toJson<String?>(sessionId),
      'userId': serializer.toJson<String?>(userId),
      'addedOn': serializer.toJson<DateTime>(addedOn),
    };
  }

  WomReward copyWith(
          {int? id,
          int? womCount,
          Value<String?> experimentId = const Value.absent(),
          Value<String?> sessionId = const Value.absent(),
          Value<String?> userId = const Value.absent(),
          DateTime? addedOn}) =>
      WomReward(
        id: id ?? this.id,
        womCount: womCount ?? this.womCount,
        experimentId:
            experimentId.present ? experimentId.value : this.experimentId,
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
        userId: userId.present ? userId.value : this.userId,
        addedOn: addedOn ?? this.addedOn,
      );
  WomReward copyWithCompanion(WomRewardsCompanion data) {
    return WomReward(
      id: data.id.present ? data.id.value : this.id,
      womCount: data.womCount.present ? data.womCount.value : this.womCount,
      experimentId: data.experimentId.present
          ? data.experimentId.value
          : this.experimentId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      userId: data.userId.present ? data.userId.value : this.userId,
      addedOn: data.addedOn.present ? data.addedOn.value : this.addedOn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WomReward(')
          ..write('id: $id, ')
          ..write('womCount: $womCount, ')
          ..write('experimentId: $experimentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('addedOn: $addedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, womCount, experimentId, sessionId, userId, addedOn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WomReward &&
          other.id == this.id &&
          other.womCount == this.womCount &&
          other.experimentId == this.experimentId &&
          other.sessionId == this.sessionId &&
          other.userId == this.userId &&
          other.addedOn == this.addedOn);
}

class WomRewardsCompanion extends UpdateCompanion<WomReward> {
  final Value<int> id;
  final Value<int> womCount;
  final Value<String?> experimentId;
  final Value<String?> sessionId;
  final Value<String?> userId;
  final Value<DateTime> addedOn;
  const WomRewardsCompanion({
    this.id = const Value.absent(),
    this.womCount = const Value.absent(),
    this.experimentId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.userId = const Value.absent(),
    this.addedOn = const Value.absent(),
  });
  WomRewardsCompanion.insert({
    this.id = const Value.absent(),
    required int womCount,
    this.experimentId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.userId = const Value.absent(),
    required DateTime addedOn,
  })  : womCount = Value(womCount),
        addedOn = Value(addedOn);
  static Insertable<WomReward> custom({
    Expression<int>? id,
    Expression<int>? womCount,
    Expression<String>? experimentId,
    Expression<String>? sessionId,
    Expression<String>? userId,
    Expression<DateTime>? addedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (womCount != null) 'wom_count': womCount,
      if (experimentId != null) 'experiment_id': experimentId,
      if (sessionId != null) 'session_id': sessionId,
      if (userId != null) 'user_id': userId,
      if (addedOn != null) 'added_on': addedOn,
    });
  }

  WomRewardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? womCount,
      Value<String?>? experimentId,
      Value<String?>? sessionId,
      Value<String?>? userId,
      Value<DateTime>? addedOn}) {
    return WomRewardsCompanion(
      id: id ?? this.id,
      womCount: womCount ?? this.womCount,
      experimentId: experimentId ?? this.experimentId,
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      addedOn: addedOn ?? this.addedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (womCount.present) {
      map['wom_count'] = Variable<int>(womCount.value);
    }
    if (experimentId.present) {
      map['experiment_id'] = Variable<String>(experimentId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (addedOn.present) {
      map['added_on'] = Variable<DateTime>(addedOn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WomRewardsCompanion(')
          ..write('id: $id, ')
          ..write('womCount: $womCount, ')
          ..write('experimentId: $experimentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('userId: $userId, ')
          ..write('addedOn: $addedOn')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SensorTracksTable sensorTracks = $SensorTracksTable(this);
  late final $SensorsDataEntriesTable sensorsDataEntries =
      $SensorsDataEntriesTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $WomTransactionsTable womTransactions =
      $WomTransactionsTable(this);
  late final $WomRewardsTable womRewards = $WomRewardsTable(this);
  late final SensorTracksDao sensorTracksDao =
      SensorTracksDao(this as AppDatabase);
  late final SensorsDataEntriesDao sensorsDataEntriesDao =
      SensorsDataEntriesDao(this as AppDatabase);
  late final SessionsDao sessionsDao = SessionsDao(this as AppDatabase);
  late final WomTransactionsDao womTransactionsDao =
      WomTransactionsDao(this as AppDatabase);
  late final WomRewardsDao womRewardsDao = WomRewardsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [sensorTracks, sensorsDataEntries, sessions, womTransactions, womRewards];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('sensor_tracks',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('sensors_data_entries', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$SensorTracksTableCreateCompanionBuilder = SensorTracksCompanion
    Function({
  Value<int> id,
  Value<SensorActivityType?> activityType,
  Value<SmartphonePosition?> smartphonePosition,
  Value<DateTime?> timestamp,
  Value<UserInfo?> userInfo,
  Value<int?> startBatteryLevel,
  Value<bool?> isInBatterySaveMode,
  Value<String?> cloudId,
  Value<int?> testDuration,
  Value<String?> experimentId,
  Value<String?> sessionId,
});
typedef $$SensorTracksTableUpdateCompanionBuilder = SensorTracksCompanion
    Function({
  Value<int> id,
  Value<SensorActivityType?> activityType,
  Value<SmartphonePosition?> smartphonePosition,
  Value<DateTime?> timestamp,
  Value<UserInfo?> userInfo,
  Value<int?> startBatteryLevel,
  Value<bool?> isInBatterySaveMode,
  Value<String?> cloudId,
  Value<int?> testDuration,
  Value<String?> experimentId,
  Value<String?> sessionId,
});

final class $$SensorTracksTableReferences
    extends BaseReferences<_$AppDatabase, $SensorTracksTable, SensorTrackData> {
  $$SensorTracksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SensorsDataEntriesTable, List<SensorsDataEntry>>
      _sensorsDataEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.sensorsDataEntries,
              aliasName: $_aliasNameGenerator(
                  db.sensorTracks.id, db.sensorsDataEntries.trackId));

  $$SensorsDataEntriesTableProcessedTableManager get sensorsDataEntriesRefs {
    final manager =
        $$SensorsDataEntriesTableTableManager($_db, $_db.sensorsDataEntries)
            .filter((f) => f.trackId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_sensorsDataEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SensorTracksTableFilterComposer
    extends Composer<_$AppDatabase, $SensorTracksTable> {
  $$SensorTracksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<SensorActivityType?, SensorActivityType,
          String>
      get activityType => $composableBuilder(
          column: $table.activityType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<SmartphonePosition?, SmartphonePosition,
          String>
      get smartphonePosition => $composableBuilder(
          column: $table.smartphonePosition,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<UserInfo?, UserInfo, String> get userInfo =>
      $composableBuilder(
          column: $table.userInfo,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get startBatteryLevel => $composableBuilder(
      column: $table.startBatteryLevel,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isInBatterySaveMode => $composableBuilder(
      column: $table.isInBatterySaveMode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get testDuration => $composableBuilder(
      column: $table.testDuration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get experimentId => $composableBuilder(
      column: $table.experimentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  Expression<bool> sensorsDataEntriesRefs(
      Expression<bool> Function($$SensorsDataEntriesTableFilterComposer f) f) {
    final $$SensorsDataEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.sensorsDataEntries,
        getReferencedColumn: (t) => t.trackId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SensorsDataEntriesTableFilterComposer(
              $db: $db,
              $table: $db.sensorsDataEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SensorTracksTableOrderingComposer
    extends Composer<_$AppDatabase, $SensorTracksTable> {
  $$SensorTracksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activityType => $composableBuilder(
      column: $table.activityType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get smartphonePosition => $composableBuilder(
      column: $table.smartphonePosition,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userInfo => $composableBuilder(
      column: $table.userInfo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startBatteryLevel => $composableBuilder(
      column: $table.startBatteryLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isInBatterySaveMode => $composableBuilder(
      column: $table.isInBatterySaveMode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cloudId => $composableBuilder(
      column: $table.cloudId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get testDuration => $composableBuilder(
      column: $table.testDuration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get experimentId => $composableBuilder(
      column: $table.experimentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));
}

class $$SensorTracksTableAnnotationComposer
    extends Composer<_$AppDatabase, $SensorTracksTable> {
  $$SensorTracksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SensorActivityType?, String>
      get activityType => $composableBuilder(
          column: $table.activityType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SmartphonePosition?, String>
      get smartphonePosition => $composableBuilder(
          column: $table.smartphonePosition, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserInfo?, String> get userInfo =>
      $composableBuilder(column: $table.userInfo, builder: (column) => column);

  GeneratedColumn<int> get startBatteryLevel => $composableBuilder(
      column: $table.startBatteryLevel, builder: (column) => column);

  GeneratedColumn<bool> get isInBatterySaveMode => $composableBuilder(
      column: $table.isInBatterySaveMode, builder: (column) => column);

  GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  GeneratedColumn<int> get testDuration => $composableBuilder(
      column: $table.testDuration, builder: (column) => column);

  GeneratedColumn<String> get experimentId => $composableBuilder(
      column: $table.experimentId, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  Expression<T> sensorsDataEntriesRefs<T extends Object>(
      Expression<T> Function($$SensorsDataEntriesTableAnnotationComposer a) f) {
    final $$SensorsDataEntriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.sensorsDataEntries,
            getReferencedColumn: (t) => t.trackId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$SensorsDataEntriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.sensorsDataEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$SensorTracksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SensorTracksTable,
    SensorTrackData,
    $$SensorTracksTableFilterComposer,
    $$SensorTracksTableOrderingComposer,
    $$SensorTracksTableAnnotationComposer,
    $$SensorTracksTableCreateCompanionBuilder,
    $$SensorTracksTableUpdateCompanionBuilder,
    (SensorTrackData, $$SensorTracksTableReferences),
    SensorTrackData,
    PrefetchHooks Function({bool sensorsDataEntriesRefs})> {
  $$SensorTracksTableTableManager(_$AppDatabase db, $SensorTracksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SensorTracksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SensorTracksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SensorTracksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<SensorActivityType?> activityType = const Value.absent(),
            Value<SmartphonePosition?> smartphonePosition =
                const Value.absent(),
            Value<DateTime?> timestamp = const Value.absent(),
            Value<UserInfo?> userInfo = const Value.absent(),
            Value<int?> startBatteryLevel = const Value.absent(),
            Value<bool?> isInBatterySaveMode = const Value.absent(),
            Value<String?> cloudId = const Value.absent(),
            Value<int?> testDuration = const Value.absent(),
            Value<String?> experimentId = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
          }) =>
              SensorTracksCompanion(
            id: id,
            activityType: activityType,
            smartphonePosition: smartphonePosition,
            timestamp: timestamp,
            userInfo: userInfo,
            startBatteryLevel: startBatteryLevel,
            isInBatterySaveMode: isInBatterySaveMode,
            cloudId: cloudId,
            testDuration: testDuration,
            experimentId: experimentId,
            sessionId: sessionId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<SensorActivityType?> activityType = const Value.absent(),
            Value<SmartphonePosition?> smartphonePosition =
                const Value.absent(),
            Value<DateTime?> timestamp = const Value.absent(),
            Value<UserInfo?> userInfo = const Value.absent(),
            Value<int?> startBatteryLevel = const Value.absent(),
            Value<bool?> isInBatterySaveMode = const Value.absent(),
            Value<String?> cloudId = const Value.absent(),
            Value<int?> testDuration = const Value.absent(),
            Value<String?> experimentId = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
          }) =>
              SensorTracksCompanion.insert(
            id: id,
            activityType: activityType,
            smartphonePosition: smartphonePosition,
            timestamp: timestamp,
            userInfo: userInfo,
            startBatteryLevel: startBatteryLevel,
            isInBatterySaveMode: isInBatterySaveMode,
            cloudId: cloudId,
            testDuration: testDuration,
            experimentId: experimentId,
            sessionId: sessionId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SensorTracksTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({sensorsDataEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (sensorsDataEntriesRefs) db.sensorsDataEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sensorsDataEntriesRefs)
                    await $_getPrefetchedData<SensorTrackData,
                            $SensorTracksTable, SensorsDataEntry>(
                        currentTable: table,
                        referencedTable: $$SensorTracksTableReferences
                            ._sensorsDataEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SensorTracksTableReferences(db, table, p0)
                                .sensorsDataEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.trackId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SensorTracksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SensorTracksTable,
    SensorTrackData,
    $$SensorTracksTableFilterComposer,
    $$SensorTracksTableOrderingComposer,
    $$SensorTracksTableAnnotationComposer,
    $$SensorTracksTableCreateCompanionBuilder,
    $$SensorTracksTableUpdateCompanionBuilder,
    (SensorTrackData, $$SensorTracksTableReferences),
    SensorTrackData,
    PrefetchHooks Function({bool sensorsDataEntriesRefs})>;
typedef $$SensorsDataEntriesTableCreateCompanionBuilder
    = SensorsDataEntriesCompanion Function({
  Value<int> id,
  required int trackId,
  Value<legacy.SensorData?> accelerometer,
  Value<legacy.SensorData?> accelerometerWithGravity,
  Value<legacy.SensorData?> gyroscope,
  Value<legacy.SensorData?> magnetometer,
  Value<String?> activityRecognized,
  Value<DateTime?> timestamp,
});
typedef $$SensorsDataEntriesTableUpdateCompanionBuilder
    = SensorsDataEntriesCompanion Function({
  Value<int> id,
  Value<int> trackId,
  Value<legacy.SensorData?> accelerometer,
  Value<legacy.SensorData?> accelerometerWithGravity,
  Value<legacy.SensorData?> gyroscope,
  Value<legacy.SensorData?> magnetometer,
  Value<String?> activityRecognized,
  Value<DateTime?> timestamp,
});

final class $$SensorsDataEntriesTableReferences extends BaseReferences<
    _$AppDatabase, $SensorsDataEntriesTable, SensorsDataEntry> {
  $$SensorsDataEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SensorTracksTable _trackIdTable(_$AppDatabase db) =>
      db.sensorTracks.createAlias($_aliasNameGenerator(
          db.sensorsDataEntries.trackId, db.sensorTracks.id));

  $$SensorTracksTableProcessedTableManager get trackId {
    final $_column = $_itemColumn<int>('track_id')!;

    final manager = $$SensorTracksTableTableManager($_db, $_db.sensorTracks)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_trackIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SensorsDataEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SensorsDataEntriesTable> {
  $$SensorsDataEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<legacy.SensorData?, legacy.SensorData, String>
      get accelerometer => $composableBuilder(
          column: $table.accelerometer,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<legacy.SensorData?, legacy.SensorData, String>
      get accelerometerWithGravity => $composableBuilder(
          column: $table.accelerometerWithGravity,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<legacy.SensorData?, legacy.SensorData, String>
      get gyroscope => $composableBuilder(
          column: $table.gyroscope,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<legacy.SensorData?, legacy.SensorData, String>
      get magnetometer => $composableBuilder(
          column: $table.magnetometer,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get activityRecognized => $composableBuilder(
      column: $table.activityRecognized,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  $$SensorTracksTableFilterComposer get trackId {
    final $$SensorTracksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.sensorTracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SensorTracksTableFilterComposer(
              $db: $db,
              $table: $db.sensorTracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SensorsDataEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SensorsDataEntriesTable> {
  $$SensorsDataEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accelerometer => $composableBuilder(
      column: $table.accelerometer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accelerometerWithGravity => $composableBuilder(
      column: $table.accelerometerWithGravity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gyroscope => $composableBuilder(
      column: $table.gyroscope, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get magnetometer => $composableBuilder(
      column: $table.magnetometer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activityRecognized => $composableBuilder(
      column: $table.activityRecognized,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  $$SensorTracksTableOrderingComposer get trackId {
    final $$SensorTracksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.sensorTracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SensorTracksTableOrderingComposer(
              $db: $db,
              $table: $db.sensorTracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SensorsDataEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SensorsDataEntriesTable> {
  $$SensorsDataEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<legacy.SensorData?, String>
      get accelerometer => $composableBuilder(
          column: $table.accelerometer, builder: (column) => column);

  GeneratedColumnWithTypeConverter<legacy.SensorData?, String>
      get accelerometerWithGravity => $composableBuilder(
          column: $table.accelerometerWithGravity, builder: (column) => column);

  GeneratedColumnWithTypeConverter<legacy.SensorData?, String> get gyroscope =>
      $composableBuilder(column: $table.gyroscope, builder: (column) => column);

  GeneratedColumnWithTypeConverter<legacy.SensorData?, String>
      get magnetometer => $composableBuilder(
          column: $table.magnetometer, builder: (column) => column);

  GeneratedColumn<String> get activityRecognized => $composableBuilder(
      column: $table.activityRecognized, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$SensorTracksTableAnnotationComposer get trackId {
    final $$SensorTracksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.trackId,
        referencedTable: $db.sensorTracks,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SensorTracksTableAnnotationComposer(
              $db: $db,
              $table: $db.sensorTracks,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SensorsDataEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SensorsDataEntriesTable,
    SensorsDataEntry,
    $$SensorsDataEntriesTableFilterComposer,
    $$SensorsDataEntriesTableOrderingComposer,
    $$SensorsDataEntriesTableAnnotationComposer,
    $$SensorsDataEntriesTableCreateCompanionBuilder,
    $$SensorsDataEntriesTableUpdateCompanionBuilder,
    (SensorsDataEntry, $$SensorsDataEntriesTableReferences),
    SensorsDataEntry,
    PrefetchHooks Function({bool trackId})> {
  $$SensorsDataEntriesTableTableManager(
      _$AppDatabase db, $SensorsDataEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SensorsDataEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SensorsDataEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SensorsDataEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> trackId = const Value.absent(),
            Value<legacy.SensorData?> accelerometer = const Value.absent(),
            Value<legacy.SensorData?> accelerometerWithGravity =
                const Value.absent(),
            Value<legacy.SensorData?> gyroscope = const Value.absent(),
            Value<legacy.SensorData?> magnetometer = const Value.absent(),
            Value<String?> activityRecognized = const Value.absent(),
            Value<DateTime?> timestamp = const Value.absent(),
          }) =>
              SensorsDataEntriesCompanion(
            id: id,
            trackId: trackId,
            accelerometer: accelerometer,
            accelerometerWithGravity: accelerometerWithGravity,
            gyroscope: gyroscope,
            magnetometer: magnetometer,
            activityRecognized: activityRecognized,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int trackId,
            Value<legacy.SensorData?> accelerometer = const Value.absent(),
            Value<legacy.SensorData?> accelerometerWithGravity =
                const Value.absent(),
            Value<legacy.SensorData?> gyroscope = const Value.absent(),
            Value<legacy.SensorData?> magnetometer = const Value.absent(),
            Value<String?> activityRecognized = const Value.absent(),
            Value<DateTime?> timestamp = const Value.absent(),
          }) =>
              SensorsDataEntriesCompanion.insert(
            id: id,
            trackId: trackId,
            accelerometer: accelerometer,
            accelerometerWithGravity: accelerometerWithGravity,
            gyroscope: gyroscope,
            magnetometer: magnetometer,
            activityRecognized: activityRecognized,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SensorsDataEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({trackId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (trackId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.trackId,
                    referencedTable:
                        $$SensorsDataEntriesTableReferences._trackIdTable(db),
                    referencedColumn: $$SensorsDataEntriesTableReferences
                        ._trackIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SensorsDataEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SensorsDataEntriesTable,
    SensorsDataEntry,
    $$SensorsDataEntriesTableFilterComposer,
    $$SensorsDataEntriesTableOrderingComposer,
    $$SensorsDataEntriesTableAnnotationComposer,
    $$SensorsDataEntriesTableCreateCompanionBuilder,
    $$SensorsDataEntriesTableUpdateCompanionBuilder,
    (SensorsDataEntry, $$SensorsDataEntriesTableReferences),
    SensorsDataEntry,
    PrefetchHooks Function({bool trackId})>;
typedef $$SessionsTableCreateCompanionBuilder = SessionsCompanion Function({
  required String sessionId,
  required String userId,
  required int age,
  required int height,
  required double weight,
  required Gender gender,
  Value<DateTime?> addedOn,
  Value<int> rowid,
});
typedef $$SessionsTableUpdateCompanionBuilder = SessionsCompanion Function({
  Value<String> sessionId,
  Value<String> userId,
  Value<int> age,
  Value<int> height,
  Value<double> weight,
  Value<Gender> gender,
  Value<DateTime?> addedOn,
  Value<int> rowid,
});

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Gender, Gender, String> get gender =>
      $composableBuilder(
          column: $table.gender,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get addedOn => $composableBuilder(
      column: $table.addedOn, builder: (column) => ColumnFilters(column));
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedOn => $composableBuilder(
      column: $table.addedOn, builder: (column) => ColumnOrderings(column));
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Gender, String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get addedOn =>
      $composableBuilder(column: $table.addedOn, builder: (column) => column);
}

class $$SessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SessionsTable,
    Session,
    $$SessionsTableFilterComposer,
    $$SessionsTableOrderingComposer,
    $$SessionsTableAnnotationComposer,
    $$SessionsTableCreateCompanionBuilder,
    $$SessionsTableUpdateCompanionBuilder,
    (Session, BaseReferences<_$AppDatabase, $SessionsTable, Session>),
    Session,
    PrefetchHooks Function()> {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> sessionId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<int> height = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<Gender> gender = const Value.absent(),
            Value<DateTime?> addedOn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionsCompanion(
            sessionId: sessionId,
            userId: userId,
            age: age,
            height: height,
            weight: weight,
            gender: gender,
            addedOn: addedOn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String sessionId,
            required String userId,
            required int age,
            required int height,
            required double weight,
            required Gender gender,
            Value<DateTime?> addedOn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SessionsCompanion.insert(
            sessionId: sessionId,
            userId: userId,
            age: age,
            height: height,
            weight: weight,
            gender: gender,
            addedOn: addedOn,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SessionsTable,
    Session,
    $$SessionsTableFilterComposer,
    $$SessionsTableOrderingComposer,
    $$SessionsTableAnnotationComposer,
    $$SessionsTableCreateCompanionBuilder,
    $$SessionsTableUpdateCompanionBuilder,
    (Session, BaseReferences<_$AppDatabase, $SessionsTable, Session>),
    Session,
    PrefetchHooks Function()>;
typedef $$WomTransactionsTableCreateCompanionBuilder = WomTransactionsCompanion
    Function({
  Value<int> id,
  required int womCount,
  required String womPin,
  required String womLink,
  Value<String?> otc,
  required DateTime addedOn,
});
typedef $$WomTransactionsTableUpdateCompanionBuilder = WomTransactionsCompanion
    Function({
  Value<int> id,
  Value<int> womCount,
  Value<String> womPin,
  Value<String> womLink,
  Value<String?> otc,
  Value<DateTime> addedOn,
});

class $$WomTransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $WomTransactionsTable> {
  $$WomTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get womCount => $composableBuilder(
      column: $table.womCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get womPin => $composableBuilder(
      column: $table.womPin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get womLink => $composableBuilder(
      column: $table.womLink, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get otc => $composableBuilder(
      column: $table.otc, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedOn => $composableBuilder(
      column: $table.addedOn, builder: (column) => ColumnFilters(column));
}

class $$WomTransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WomTransactionsTable> {
  $$WomTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get womCount => $composableBuilder(
      column: $table.womCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get womPin => $composableBuilder(
      column: $table.womPin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get womLink => $composableBuilder(
      column: $table.womLink, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get otc => $composableBuilder(
      column: $table.otc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedOn => $composableBuilder(
      column: $table.addedOn, builder: (column) => ColumnOrderings(column));
}

class $$WomTransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WomTransactionsTable> {
  $$WomTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get womCount =>
      $composableBuilder(column: $table.womCount, builder: (column) => column);

  GeneratedColumn<String> get womPin =>
      $composableBuilder(column: $table.womPin, builder: (column) => column);

  GeneratedColumn<String> get womLink =>
      $composableBuilder(column: $table.womLink, builder: (column) => column);

  GeneratedColumn<String> get otc =>
      $composableBuilder(column: $table.otc, builder: (column) => column);

  GeneratedColumn<DateTime> get addedOn =>
      $composableBuilder(column: $table.addedOn, builder: (column) => column);
}

class $$WomTransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WomTransactionsTable,
    WomTransaction,
    $$WomTransactionsTableFilterComposer,
    $$WomTransactionsTableOrderingComposer,
    $$WomTransactionsTableAnnotationComposer,
    $$WomTransactionsTableCreateCompanionBuilder,
    $$WomTransactionsTableUpdateCompanionBuilder,
    (
      WomTransaction,
      BaseReferences<_$AppDatabase, $WomTransactionsTable, WomTransaction>
    ),
    WomTransaction,
    PrefetchHooks Function()> {
  $$WomTransactionsTableTableManager(
      _$AppDatabase db, $WomTransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WomTransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WomTransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WomTransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> womCount = const Value.absent(),
            Value<String> womPin = const Value.absent(),
            Value<String> womLink = const Value.absent(),
            Value<String?> otc = const Value.absent(),
            Value<DateTime> addedOn = const Value.absent(),
          }) =>
              WomTransactionsCompanion(
            id: id,
            womCount: womCount,
            womPin: womPin,
            womLink: womLink,
            otc: otc,
            addedOn: addedOn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int womCount,
            required String womPin,
            required String womLink,
            Value<String?> otc = const Value.absent(),
            required DateTime addedOn,
          }) =>
              WomTransactionsCompanion.insert(
            id: id,
            womCount: womCount,
            womPin: womPin,
            womLink: womLink,
            otc: otc,
            addedOn: addedOn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WomTransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WomTransactionsTable,
    WomTransaction,
    $$WomTransactionsTableFilterComposer,
    $$WomTransactionsTableOrderingComposer,
    $$WomTransactionsTableAnnotationComposer,
    $$WomTransactionsTableCreateCompanionBuilder,
    $$WomTransactionsTableUpdateCompanionBuilder,
    (
      WomTransaction,
      BaseReferences<_$AppDatabase, $WomTransactionsTable, WomTransaction>
    ),
    WomTransaction,
    PrefetchHooks Function()>;
typedef $$WomRewardsTableCreateCompanionBuilder = WomRewardsCompanion Function({
  Value<int> id,
  required int womCount,
  Value<String?> experimentId,
  Value<String?> sessionId,
  Value<String?> userId,
  required DateTime addedOn,
});
typedef $$WomRewardsTableUpdateCompanionBuilder = WomRewardsCompanion Function({
  Value<int> id,
  Value<int> womCount,
  Value<String?> experimentId,
  Value<String?> sessionId,
  Value<String?> userId,
  Value<DateTime> addedOn,
});

class $$WomRewardsTableFilterComposer
    extends Composer<_$AppDatabase, $WomRewardsTable> {
  $$WomRewardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get womCount => $composableBuilder(
      column: $table.womCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get experimentId => $composableBuilder(
      column: $table.experimentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedOn => $composableBuilder(
      column: $table.addedOn, builder: (column) => ColumnFilters(column));
}

class $$WomRewardsTableOrderingComposer
    extends Composer<_$AppDatabase, $WomRewardsTable> {
  $$WomRewardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get womCount => $composableBuilder(
      column: $table.womCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get experimentId => $composableBuilder(
      column: $table.experimentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedOn => $composableBuilder(
      column: $table.addedOn, builder: (column) => ColumnOrderings(column));
}

class $$WomRewardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WomRewardsTable> {
  $$WomRewardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get womCount =>
      $composableBuilder(column: $table.womCount, builder: (column) => column);

  GeneratedColumn<String> get experimentId => $composableBuilder(
      column: $table.experimentId, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get addedOn =>
      $composableBuilder(column: $table.addedOn, builder: (column) => column);
}

class $$WomRewardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WomRewardsTable,
    WomReward,
    $$WomRewardsTableFilterComposer,
    $$WomRewardsTableOrderingComposer,
    $$WomRewardsTableAnnotationComposer,
    $$WomRewardsTableCreateCompanionBuilder,
    $$WomRewardsTableUpdateCompanionBuilder,
    (WomReward, BaseReferences<_$AppDatabase, $WomRewardsTable, WomReward>),
    WomReward,
    PrefetchHooks Function()> {
  $$WomRewardsTableTableManager(_$AppDatabase db, $WomRewardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WomRewardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WomRewardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WomRewardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> womCount = const Value.absent(),
            Value<String?> experimentId = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
            Value<String?> userId = const Value.absent(),
            Value<DateTime> addedOn = const Value.absent(),
          }) =>
              WomRewardsCompanion(
            id: id,
            womCount: womCount,
            experimentId: experimentId,
            sessionId: sessionId,
            userId: userId,
            addedOn: addedOn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int womCount,
            Value<String?> experimentId = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
            Value<String?> userId = const Value.absent(),
            required DateTime addedOn,
          }) =>
              WomRewardsCompanion.insert(
            id: id,
            womCount: womCount,
            experimentId: experimentId,
            sessionId: sessionId,
            userId: userId,
            addedOn: addedOn,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WomRewardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WomRewardsTable,
    WomReward,
    $$WomRewardsTableFilterComposer,
    $$WomRewardsTableOrderingComposer,
    $$WomRewardsTableAnnotationComposer,
    $$WomRewardsTableCreateCompanionBuilder,
    $$WomRewardsTableUpdateCompanionBuilder,
    (WomReward, BaseReferences<_$AppDatabase, $WomRewardsTable, WomReward>),
    WomReward,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SensorTracksTableTableManager get sensorTracks =>
      $$SensorTracksTableTableManager(_db, _db.sensorTracks);
  $$SensorsDataEntriesTableTableManager get sensorsDataEntries =>
      $$SensorsDataEntriesTableTableManager(_db, _db.sensorsDataEntries);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$WomTransactionsTableTableManager get womTransactions =>
      $$WomTransactionsTableTableManager(_db, _db.womTransactions);
  $$WomRewardsTableTableManager get womRewards =>
      $$WomRewardsTableTableManager(_db, _db.womRewards);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAppDatabaseHash() => r'10738883e5ca7df0f96b8496c5da70a102217042';

/// See also [getAppDatabase].
@ProviderFor(getAppDatabase)
final getAppDatabaseProvider = Provider<AppDatabase>.internal(
  getAppDatabase,
  name: r'getAppDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAppDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
