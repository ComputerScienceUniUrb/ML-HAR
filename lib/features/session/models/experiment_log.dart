import 'package:aifit/app/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'experiment_log.g.dart';
part 'experiment_log.freezed.dart';


@freezed
abstract class ExperimentLog with _$ExperimentLog {
  const factory ExperimentLog({
    required String id,
    required String experimentId,
    required String runningId,
    @TimestampConverter() required DateTime createdAt,
  }) = _ExperimentLog;

  factory ExperimentLog.fromJson(Map<String, dynamic> json) =>
      _$ExperimentLogFromJson(json);
}