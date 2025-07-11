// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivitySession _$ActivitySessionFromJson(Map<String, dynamic> json) =>
    _ActivitySession(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      runningId: json['runningId'] as String?,
      selectedExperimentId: json['selectedExperimentId'] as String?,
      description: json['description'] as String?,
      experiments: (json['experiments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$SessionStatusEnumMap, json['status']) ??
          SessionStatus.opened,
    );

Map<String, dynamic> _$ActivitySessionToJson(_ActivitySession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'runningId': instance.runningId,
      'selectedExperimentId': instance.selectedExperimentId,
      'description': instance.description,
      'experiments': instance.experiments,
      'status': _$SessionStatusEnumMap[instance.status]!,
    };

const _$SessionStatusEnumMap = {
  SessionStatus.draft: 'draft',
  SessionStatus.opened: 'opened',
  SessionStatus.live: 'live',
  SessionStatus.closed: 'closed',
};
