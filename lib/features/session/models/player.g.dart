// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
      id: json['id'] as String,
      subscribedOn: const TimestampConverter().fromJson(json['subscribedOn']),
      age: (json['age'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      experimentLogs: (json['experimentLogs'] as List<dynamic>?)
              ?.map((e) => ExperimentLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
      'id': instance.id,
      'subscribedOn': const TimestampConverter().toJson(instance.subscribedOn),
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'gender': _$GenderEnumMap[instance.gender],
      'experimentLogs': instance.experimentLogs,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.notBinary: 'notBinary',
  Gender.notAvailable: 'notAvailable',
};
