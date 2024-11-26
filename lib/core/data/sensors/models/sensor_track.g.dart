// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_track.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSensorTrackCollection on Isar {
  IsarCollection<SensorTrack> get sensorTracks => this.collection();
}

const SensorTrackSchema = CollectionSchema(
  name: r'SensorTrack',
  id: -6566800516414985688,
  properties: {
    r'activityType': PropertySchema(
      id: 0,
      name: r'activityType',
      type: IsarType.string,
      enumMap: _SensorTrackactivityTypeEnumValueMap,
    ),
    r'cloudId': PropertySchema(
      id: 1,
      name: r'cloudId',
      type: IsarType.string,
    ),
    r'isInBatterySaveMode': PropertySchema(
      id: 2,
      name: r'isInBatterySaveMode',
      type: IsarType.bool,
    ),
    r'sensorsData': PropertySchema(
      id: 3,
      name: r'sensorsData',
      type: IsarType.objectList,
      target: r'SensorsData',
    ),
    r'smartphonePosition': PropertySchema(
      id: 4,
      name: r'smartphonePosition',
      type: IsarType.string,
      enumMap: _SensorTracksmartphonePositionEnumValueMap,
    ),
    r'startBatteryLevel': PropertySchema(
      id: 5,
      name: r'startBatteryLevel',
      type: IsarType.long,
    ),
    r'testDuration': PropertySchema(
      id: 6,
      name: r'testDuration',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 7,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'userInfo': PropertySchema(
      id: 8,
      name: r'userInfo',
      type: IsarType.object,
      target: r'UserInfo',
    )
  },
  estimateSize: _sensorTrackEstimateSize,
  serialize: _sensorTrackSerialize,
  deserialize: _sensorTrackDeserialize,
  deserializeProp: _sensorTrackDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'SensorsData': SensorsDataSchema,
    r'SensorData': SensorDataSchema,
    r'UserInfo': UserInfoSchema
  },
  getId: _sensorTrackGetId,
  getLinks: _sensorTrackGetLinks,
  attach: _sensorTrackAttach,
  version: '3.1.0+1',
);

int _sensorTrackEstimateSize(
  SensorTrack object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.activityType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.cloudId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.sensorsData;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[SensorsData]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              SensorsDataSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.smartphonePosition;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.userInfo;
    if (value != null) {
      bytesCount += 3 +
          UserInfoSchema.estimateSize(value, allOffsets[UserInfo]!, allOffsets);
    }
  }
  return bytesCount;
}

void _sensorTrackSerialize(
  SensorTrack object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activityType?.name);
  writer.writeString(offsets[1], object.cloudId);
  writer.writeBool(offsets[2], object.isInBatterySaveMode);
  writer.writeObjectList<SensorsData>(
    offsets[3],
    allOffsets,
    SensorsDataSchema.serialize,
    object.sensorsData,
  );
  writer.writeString(offsets[4], object.smartphonePosition?.name);
  writer.writeLong(offsets[5], object.startBatteryLevel);
  writer.writeLong(offsets[6], object.testDuration);
  writer.writeDateTime(offsets[7], object.timestamp);
  writer.writeObject<UserInfo>(
    offsets[8],
    allOffsets,
    UserInfoSchema.serialize,
    object.userInfo,
  );
}

SensorTrack _sensorTrackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SensorTrack(
    activityType: _SensorTrackactivityTypeValueEnumMap[
        reader.readStringOrNull(offsets[0])],
    cloudId: reader.readStringOrNull(offsets[1]),
    isInBatterySaveMode: reader.readBoolOrNull(offsets[2]),
    sensorsData: reader.readObjectList<SensorsData>(
      offsets[3],
      SensorsDataSchema.deserialize,
      allOffsets,
      SensorsData(),
    ),
    smartphonePosition: _SensorTracksmartphonePositionValueEnumMap[
        reader.readStringOrNull(offsets[4])],
    startBatteryLevel: reader.readLongOrNull(offsets[5]),
    testDuration: reader.readLongOrNull(offsets[6]),
    timestamp: reader.readDateTimeOrNull(offsets[7]),
    userInfo: reader.readObjectOrNull<UserInfo>(
      offsets[8],
      UserInfoSchema.deserialize,
      allOffsets,
    ),
  );
  object.id = id;
  return object;
}

P _sensorTrackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SensorTrackactivityTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<SensorsData>(
        offset,
        SensorsDataSchema.deserialize,
        allOffsets,
        SensorsData(),
      )) as P;
    case 4:
      return (_SensorTracksmartphonePositionValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readObjectOrNull<UserInfo>(
        offset,
        UserInfoSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SensorTrackactivityTypeEnumValueMap = {
  r'onBicycle': r'onBicycle',
  r'inVehicle': r'inVehicle',
  r'stand': r'stand',
  r'sit': r'sit',
  r'talkSit': r'talkSit',
  r'standSit': r'standSit',
  r'lay': r'lay',
  r'jump': r'jump',
  r'walk': r'walk',
  r'walkingBack': r'walkingBack',
  r'walkingCircle': r'walkingCircle',
  r'run': r'run',
};
const _SensorTrackactivityTypeValueEnumMap = {
  r'onBicycle': SensorActivityType.onBicycle,
  r'inVehicle': SensorActivityType.inVehicle,
  r'stand': SensorActivityType.stand,
  r'sit': SensorActivityType.sit,
  r'talkSit': SensorActivityType.talkSit,
  r'standSit': SensorActivityType.standSit,
  r'lay': SensorActivityType.lay,
  r'jump': SensorActivityType.jump,
  r'walk': SensorActivityType.walk,
  r'walkingBack': SensorActivityType.walkingBack,
  r'walkingCircle': SensorActivityType.walkingCircle,
  r'run': SensorActivityType.run,
};
const _SensorTracksmartphonePositionEnumValueMap = {
  r'byHand': r'byHand',
  r'byHandPortrait': r'byHandPortrait',
  r'pocket': r'pocket',
  r'pouch': r'pouch',
  r'handleBar': r'handleBar',
};
const _SensorTracksmartphonePositionValueEnumMap = {
  r'byHand': SmartphonePosition.byHand,
  r'byHandPortrait': SmartphonePosition.byHandPortrait,
  r'pocket': SmartphonePosition.pocket,
  r'pouch': SmartphonePosition.pouch,
  r'handleBar': SmartphonePosition.handleBar,
};

Id _sensorTrackGetId(SensorTrack object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _sensorTrackGetLinks(SensorTrack object) {
  return [];
}

void _sensorTrackAttach(
    IsarCollection<dynamic> col, Id id, SensorTrack object) {
  object.id = id;
}

extension SensorTrackQueryWhereSort
    on QueryBuilder<SensorTrack, SensorTrack, QWhere> {
  QueryBuilder<SensorTrack, SensorTrack, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SensorTrackQueryWhere
    on QueryBuilder<SensorTrack, SensorTrack, QWhereClause> {
  QueryBuilder<SensorTrack, SensorTrack, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SensorTrackQueryFilter
    on QueryBuilder<SensorTrack, SensorTrack, QFilterCondition> {
  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activityType',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activityType',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeEqualTo(
    SensorActivityType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeGreaterThan(
    SensorActivityType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeLessThan(
    SensorActivityType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeBetween(
    SensorActivityType? lower,
    SensorActivityType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      activityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      cloudIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cloudId',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      cloudIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cloudId',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> cloudIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cloudId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      cloudIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cloudId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> cloudIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cloudId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> cloudIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cloudId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      cloudIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cloudId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> cloudIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cloudId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> cloudIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cloudId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> cloudIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cloudId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      cloudIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cloudId',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      cloudIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cloudId',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      isInBatterySaveModeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isInBatterySaveMode',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      isInBatterySaveModeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isInBatterySaveMode',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      isInBatterySaveModeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInBatterySaveMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sensorsData',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sensorsData',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sensorsData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sensorsData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sensorsData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sensorsData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sensorsData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sensorsData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smartphonePosition',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smartphonePosition',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionEqualTo(
    SmartphonePosition? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartphonePosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionGreaterThan(
    SmartphonePosition? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smartphonePosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionLessThan(
    SmartphonePosition? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smartphonePosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionBetween(
    SmartphonePosition? lower,
    SmartphonePosition? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smartphonePosition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'smartphonePosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'smartphonePosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'smartphonePosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'smartphonePosition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartphonePosition',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      smartphonePositionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'smartphonePosition',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      startBatteryLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startBatteryLevel',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      startBatteryLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startBatteryLevel',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      startBatteryLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startBatteryLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      startBatteryLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startBatteryLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      startBatteryLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startBatteryLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      startBatteryLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startBatteryLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      testDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'testDuration',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      testDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'testDuration',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      testDurationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'testDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      testDurationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'testDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      testDurationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'testDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      testDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'testDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      timestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      timestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      timestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      userInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userInfo',
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      userInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userInfo',
      ));
    });
  }
}

extension SensorTrackQueryObject
    on QueryBuilder<SensorTrack, SensorTrack, QFilterCondition> {
  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataElement(FilterQuery<SensorsData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sensorsData');
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> userInfo(
      FilterQuery<UserInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'userInfo');
    });
  }
}

extension SensorTrackQueryLinks
    on QueryBuilder<SensorTrack, SensorTrack, QFilterCondition> {}

extension SensorTrackQuerySortBy
    on QueryBuilder<SensorTrack, SensorTrack, QSortBy> {
  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> sortByActivityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortByActivityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> sortByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> sortByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortByIsInBatterySaveMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInBatterySaveMode', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortByIsInBatterySaveModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInBatterySaveMode', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortBySmartphonePosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartphonePosition', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortBySmartphonePositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartphonePosition', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortByStartBatteryLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBatteryLevel', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortByStartBatteryLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBatteryLevel', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> sortByTestDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testDuration', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      sortByTestDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testDuration', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension SensorTrackQuerySortThenBy
    on QueryBuilder<SensorTrack, SensorTrack, QSortThenBy> {
  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenByActivityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenByActivityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenByCloudId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenByCloudIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cloudId', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenByIsInBatterySaveMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInBatterySaveMode', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenByIsInBatterySaveModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInBatterySaveMode', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenBySmartphonePosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartphonePosition', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenBySmartphonePositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartphonePosition', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenByStartBatteryLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBatteryLevel', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenByStartBatteryLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startBatteryLevel', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenByTestDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testDuration', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy>
      thenByTestDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testDuration', Sort.desc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension SensorTrackQueryWhereDistinct
    on QueryBuilder<SensorTrack, SensorTrack, QDistinct> {
  QueryBuilder<SensorTrack, SensorTrack, QDistinct> distinctByActivityType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QDistinct> distinctByCloudId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cloudId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QDistinct>
      distinctByIsInBatterySaveMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInBatterySaveMode');
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QDistinct>
      distinctBySmartphonePosition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartphonePosition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QDistinct>
      distinctByStartBatteryLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startBatteryLevel');
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QDistinct> distinctByTestDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'testDuration');
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension SensorTrackQueryProperty
    on QueryBuilder<SensorTrack, SensorTrack, QQueryProperty> {
  QueryBuilder<SensorTrack, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SensorTrack, SensorActivityType?, QQueryOperations>
      activityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityType');
    });
  }

  QueryBuilder<SensorTrack, String?, QQueryOperations> cloudIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cloudId');
    });
  }

  QueryBuilder<SensorTrack, bool?, QQueryOperations>
      isInBatterySaveModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInBatterySaveMode');
    });
  }

  QueryBuilder<SensorTrack, List<SensorsData>?, QQueryOperations>
      sensorsDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sensorsData');
    });
  }

  QueryBuilder<SensorTrack, SmartphonePosition?, QQueryOperations>
      smartphonePositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smartphonePosition');
    });
  }

  QueryBuilder<SensorTrack, int?, QQueryOperations>
      startBatteryLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startBatteryLevel');
    });
  }

  QueryBuilder<SensorTrack, int?, QQueryOperations> testDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'testDuration');
    });
  }

  QueryBuilder<SensorTrack, DateTime?, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<SensorTrack, UserInfo?, QQueryOperations> userInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userInfo');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SensorsDataSchema = Schema(
  name: r'SensorsData',
  id: -100319779554447397,
  properties: {
    r'accelerometer': PropertySchema(
      id: 0,
      name: r'accelerometer',
      type: IsarType.object,
      target: r'SensorData',
    ),
    r'accelerometerWithGravity': PropertySchema(
      id: 1,
      name: r'accelerometerWithGravity',
      type: IsarType.object,
      target: r'SensorData',
    ),
    r'activityRecognized': PropertySchema(
      id: 2,
      name: r'activityRecognized',
      type: IsarType.string,
    ),
    r'gyroscope': PropertySchema(
      id: 3,
      name: r'gyroscope',
      type: IsarType.object,
      target: r'SensorData',
    ),
    r'magnetometer': PropertySchema(
      id: 4,
      name: r'magnetometer',
      type: IsarType.object,
      target: r'SensorData',
    ),
    r'timestamp': PropertySchema(
      id: 5,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sensorsDataEstimateSize,
  serialize: _sensorsDataSerialize,
  deserialize: _sensorsDataDeserialize,
  deserializeProp: _sensorsDataDeserializeProp,
);

int _sensorsDataEstimateSize(
  SensorsData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accelerometer;
    if (value != null) {
      bytesCount += 3 +
          SensorDataSchema.estimateSize(
              value, allOffsets[SensorData]!, allOffsets);
    }
  }
  {
    final value = object.accelerometerWithGravity;
    if (value != null) {
      bytesCount += 3 +
          SensorDataSchema.estimateSize(
              value, allOffsets[SensorData]!, allOffsets);
    }
  }
  {
    final value = object.activityRecognized;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gyroscope;
    if (value != null) {
      bytesCount += 3 +
          SensorDataSchema.estimateSize(
              value, allOffsets[SensorData]!, allOffsets);
    }
  }
  {
    final value = object.magnetometer;
    if (value != null) {
      bytesCount += 3 +
          SensorDataSchema.estimateSize(
              value, allOffsets[SensorData]!, allOffsets);
    }
  }
  return bytesCount;
}

void _sensorsDataSerialize(
  SensorsData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<SensorData>(
    offsets[0],
    allOffsets,
    SensorDataSchema.serialize,
    object.accelerometer,
  );
  writer.writeObject<SensorData>(
    offsets[1],
    allOffsets,
    SensorDataSchema.serialize,
    object.accelerometerWithGravity,
  );
  writer.writeString(offsets[2], object.activityRecognized);
  writer.writeObject<SensorData>(
    offsets[3],
    allOffsets,
    SensorDataSchema.serialize,
    object.gyroscope,
  );
  writer.writeObject<SensorData>(
    offsets[4],
    allOffsets,
    SensorDataSchema.serialize,
    object.magnetometer,
  );
  writer.writeDateTime(offsets[5], object.timestamp);
}

SensorsData _sensorsDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SensorsData();
  object.accelerometer = reader.readObjectOrNull<SensorData>(
    offsets[0],
    SensorDataSchema.deserialize,
    allOffsets,
  );
  object.accelerometerWithGravity = reader.readObjectOrNull<SensorData>(
    offsets[1],
    SensorDataSchema.deserialize,
    allOffsets,
  );
  object.activityRecognized = reader.readStringOrNull(offsets[2]);
  object.gyroscope = reader.readObjectOrNull<SensorData>(
    offsets[3],
    SensorDataSchema.deserialize,
    allOffsets,
  );
  object.magnetometer = reader.readObjectOrNull<SensorData>(
    offsets[4],
    SensorDataSchema.deserialize,
    allOffsets,
  );
  object.timestamp = reader.readDateTimeOrNull(offsets[5]);
  return object;
}

P _sensorsDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<SensorData>(
        offset,
        SensorDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<SensorData>(
        offset,
        SensorDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<SensorData>(
        offset,
        SensorDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectOrNull<SensorData>(
        offset,
        SensorDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SensorsDataQueryFilter
    on QueryBuilder<SensorsData, SensorsData, QFilterCondition> {
  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      accelerometerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accelerometer',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      accelerometerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accelerometer',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      accelerometerWithGravityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accelerometerWithGravity',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      accelerometerWithGravityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accelerometerWithGravity',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activityRecognized',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activityRecognized',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityRecognized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityRecognized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityRecognized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityRecognized',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activityRecognized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activityRecognized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activityRecognized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activityRecognized',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityRecognized',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      activityRecognizedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activityRecognized',
        value: '',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      gyroscopeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gyroscope',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      gyroscopeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gyroscope',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      magnetometerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'magnetometer',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      magnetometerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'magnetometer',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      timestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      timestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      timestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SensorsDataQueryObject
    on QueryBuilder<SensorsData, SensorsData, QFilterCondition> {
  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition> accelerometer(
      FilterQuery<SensorData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'accelerometer');
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition>
      accelerometerWithGravity(FilterQuery<SensorData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'accelerometerWithGravity');
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition> gyroscope(
      FilterQuery<SensorData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'gyroscope');
    });
  }

  QueryBuilder<SensorsData, SensorsData, QAfterFilterCondition> magnetometer(
      FilterQuery<SensorData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'magnetometer');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SensorDataSchema = Schema(
  name: r'SensorData',
  id: -4425084427627382434,
  properties: {
    r'timestamp': PropertySchema(
      id: 0,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'x': PropertySchema(
      id: 1,
      name: r'x',
      type: IsarType.double,
    ),
    r'y': PropertySchema(
      id: 2,
      name: r'y',
      type: IsarType.double,
    ),
    r'z': PropertySchema(
      id: 3,
      name: r'z',
      type: IsarType.double,
    )
  },
  estimateSize: _sensorDataEstimateSize,
  serialize: _sensorDataSerialize,
  deserialize: _sensorDataDeserialize,
  deserializeProp: _sensorDataDeserializeProp,
);

int _sensorDataEstimateSize(
  SensorData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _sensorDataSerialize(
  SensorData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.timestamp);
  writer.writeDouble(offsets[1], object.x);
  writer.writeDouble(offsets[2], object.y);
  writer.writeDouble(offsets[3], object.z);
}

SensorData _sensorDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SensorData();
  object.timestamp = reader.readDateTimeOrNull(offsets[0]);
  object.x = reader.readDoubleOrNull(offsets[1]);
  object.y = reader.readDoubleOrNull(offsets[2]);
  object.z = reader.readDoubleOrNull(offsets[3]);
  return object;
}

P _sensorDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SensorDataQueryFilter
    on QueryBuilder<SensorData, SensorData, QFilterCondition> {
  QueryBuilder<SensorData, SensorData, QAfterFilterCondition>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> timestampEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> timestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> timestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> xIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'x',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> xIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'x',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> xEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> xGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> xLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> xBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'x',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> yIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'y',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> yIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'y',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> yEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> yGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> yLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> yBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'y',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> zIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'z',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> zIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'z',
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> zEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'z',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> zGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'z',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> zLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'z',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SensorData, SensorData, QAfterFilterCondition> zBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'z',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SensorDataQueryObject
    on QueryBuilder<SensorData, SensorData, QFilterCondition> {}
