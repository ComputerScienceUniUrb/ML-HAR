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
    r'sensorsData': PropertySchema(
      id: 1,
      name: r'sensorsData',
      type: IsarType.objectList,
      target: r'SensorsData',
    ),
    r'smartphonePosition': PropertySchema(
      id: 2,
      name: r'smartphonePosition',
      type: IsarType.string,
      enumMap: _SensorTracksmartphonePositionEnumValueMap,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.dateTime,
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
    r'SensorData': SensorDataSchema
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
  return bytesCount;
}

void _sensorTrackSerialize(
  SensorTrack object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activityType?.name);
  writer.writeObjectList<SensorsData>(
    offsets[1],
    allOffsets,
    SensorsDataSchema.serialize,
    object.sensorsData,
  );
  writer.writeString(offsets[2], object.smartphonePosition?.name);
  writer.writeDateTime(offsets[3], object.timestamp);
}

SensorTrack _sensorTrackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SensorTrack();
  object.activityType =
      _SensorTrackactivityTypeValueEnumMap[reader.readStringOrNull(offsets[0])];
  object.id = id;
  object.sensorsData = reader.readObjectList<SensorsData>(
    offsets[1],
    SensorsDataSchema.deserialize,
    allOffsets,
    SensorsData(),
  );
  object.smartphonePosition = _SensorTracksmartphonePositionValueEnumMap[
      reader.readStringOrNull(offsets[2])];
  object.timestamp = reader.readDateTimeOrNull(offsets[3]);
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
      return (reader.readObjectList<SensorsData>(
        offset,
        SensorsDataSchema.deserialize,
        allOffsets,
        SensorsData(),
      )) as P;
    case 2:
      return (_SensorTracksmartphonePositionValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
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
  return object.id;
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

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition> idGreaterThan(
    Id value, {
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
    Id value, {
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
    Id lower,
    Id upper, {
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
}

extension SensorTrackQueryObject
    on QueryBuilder<SensorTrack, SensorTrack, QFilterCondition> {
  QueryBuilder<SensorTrack, SensorTrack, QAfterFilterCondition>
      sensorsDataElement(FilterQuery<SensorsData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sensorsData');
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

  QueryBuilder<SensorTrack, SensorTrack, QDistinct>
      distinctBySmartphonePosition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartphonePosition',
          caseSensitive: caseSensitive);
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

  QueryBuilder<SensorTrack, DateTime?, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
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
    r'activityRecognized': PropertySchema(
      id: 1,
      name: r'activityRecognized',
      type: IsarType.string,
    ),
    r'gyroscope': PropertySchema(
      id: 2,
      name: r'gyroscope',
      type: IsarType.object,
      target: r'SensorData',
    ),
    r'magnetometer': PropertySchema(
      id: 3,
      name: r'magnetometer',
      type: IsarType.object,
      target: r'SensorData',
    ),
    r'timestamp': PropertySchema(
      id: 4,
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
  writer.writeString(offsets[1], object.activityRecognized);
  writer.writeObject<SensorData>(
    offsets[2],
    allOffsets,
    SensorDataSchema.serialize,
    object.gyroscope,
  );
  writer.writeObject<SensorData>(
    offsets[3],
    allOffsets,
    SensorDataSchema.serialize,
    object.magnetometer,
  );
  writer.writeDateTime(offsets[4], object.timestamp);
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
  object.activityRecognized = reader.readStringOrNull(offsets[1]);
  object.gyroscope = reader.readObjectOrNull<SensorData>(
    offsets[2],
    SensorDataSchema.deserialize,
    allOffsets,
  );
  object.magnetometer = reader.readObjectOrNull<SensorData>(
    offsets[3],
    SensorDataSchema.deserialize,
    allOffsets,
  );
  object.timestamp = reader.readDateTimeOrNull(offsets[4]);
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
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<SensorData>(
        offset,
        SensorDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<SensorData>(
        offset,
        SensorDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
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
