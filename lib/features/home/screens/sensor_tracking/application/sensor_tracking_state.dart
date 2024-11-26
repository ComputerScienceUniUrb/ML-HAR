import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_tracking_state.freezed.dart';

@freezed
class SensorTrackingState with _$SensorTrackingState {
  const factory SensorTrackingState.data({
    required double remainingInSecond,
    required int samples,
    String? activityRecognized,
  }) = SensorTrackingStateData;

  const factory SensorTrackingState.loading() = SensorTrackingStateLoading;

  const factory SensorTrackingState.completed({
    required SensorTrack track,
    @Default(false) bool isUploading,
    Object? error,
  }) = SensorTrackingStateCompleted;

  const factory SensorTrackingState.uploaded({
    required SensorTrack track,
  }) = SensorTrackingStateUploaded;

  const factory SensorTrackingState.initial() = SensorTrackingStateInitial;

  const factory SensorTrackingState.error(Object error, StackTrace st) =
      SensorTrackingStateError;
}
