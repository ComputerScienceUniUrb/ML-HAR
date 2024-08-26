import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_tracking_state.freezed.dart';

@freezed
class SensorTrackingState with _$SensorTrackingState {
  const factory SensorTrackingState.data({
    required double remainingInSecond,
  }) = SensorTrackingStateData;

  const factory SensorTrackingState.loading() = SensorTrackingStateLoading;

  const factory SensorTrackingState.initial() = SensorTrackingStateInitial;

  const factory SensorTrackingState.error(Object error, StackTrace st) =
      SensorTrackingStateError;
}
