import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/features/home/screens/sensor_tracking/sensor_tracking.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_tracking_state.freezed.dart';

@freezed
class SensorTrackingState with _$SensorTrackingState {
  const factory SensorTrackingState.data({
    required double remainingInSecond,
    required int samples,
  }) = SensorTrackingStateData;

  const factory SensorTrackingState.loading() = SensorTrackingStateLoading;

  const factory SensorTrackingState.completed({required SensorTrack track}) =
      SensorTrackingStateCompleted;

  const factory SensorTrackingState.initial() = SensorTrackingStateInitial;

  const factory SensorTrackingState.error(Object error, StackTrace st) =
      SensorTrackingStateError;
}
