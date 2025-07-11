import 'package:aifit/app/converters.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'experiment.freezed.dart';

part 'experiment.g.dart';

@freezed
abstract class Experiment with _$Experiment {
  const factory Experiment({
    required String id,
    required String name,
    required String shortCode,
    @TimestampConverter() required DateTime createdAt,
    String? description,
    SensorActivityType? activityTypeOverride,
    SmartphonePosition? smartphonePositionOverride,
    int? duration,
    @Default(false) bool enabled,
  }) = _Experiment;

  factory Experiment.fromJson(Map<String, dynamic> json) =>
      _$ExperimentFromJson(json);
}