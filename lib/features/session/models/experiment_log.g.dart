// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExperimentLog _$ExperimentLogFromJson(Map<String, dynamic> json) =>
    _ExperimentLog(
      id: json['id'] as String,
      experimentId: json['experimentId'] as String,
      runningId: json['runningId'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$ExperimentLogToJson(_ExperimentLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'experimentId': instance.experimentId,
      'runningId': instance.runningId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
