// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorTrackingState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SensorTrackingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SensorTrackingState()';
  }
}

/// @nodoc
class $SensorTrackingStateCopyWith<$Res> {
  $SensorTrackingStateCopyWith(
      SensorTrackingState _, $Res Function(SensorTrackingState) __);
}

/// @nodoc

class SensorTrackingStateData implements SensorTrackingState {
  const SensorTrackingStateData(
      {required this.remainingInSecond,
      required this.samples,
      this.activityRecognized});

  final double remainingInSecond;
  final int samples;
  final String? activityRecognized;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorTrackingStateDataCopyWith<SensorTrackingStateData> get copyWith =>
      _$SensorTrackingStateDataCopyWithImpl<SensorTrackingStateData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorTrackingStateData &&
            (identical(other.remainingInSecond, remainingInSecond) ||
                other.remainingInSecond == remainingInSecond) &&
            (identical(other.samples, samples) || other.samples == samples) &&
            (identical(other.activityRecognized, activityRecognized) ||
                other.activityRecognized == activityRecognized));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remainingInSecond, samples, activityRecognized);

  @override
  String toString() {
    return 'SensorTrackingState.data(remainingInSecond: $remainingInSecond, samples: $samples, activityRecognized: $activityRecognized)';
  }
}

/// @nodoc
abstract mixin class $SensorTrackingStateDataCopyWith<$Res>
    implements $SensorTrackingStateCopyWith<$Res> {
  factory $SensorTrackingStateDataCopyWith(SensorTrackingStateData value,
          $Res Function(SensorTrackingStateData) _then) =
      _$SensorTrackingStateDataCopyWithImpl;
  @useResult
  $Res call(
      {double remainingInSecond, int samples, String? activityRecognized});
}

/// @nodoc
class _$SensorTrackingStateDataCopyWithImpl<$Res>
    implements $SensorTrackingStateDataCopyWith<$Res> {
  _$SensorTrackingStateDataCopyWithImpl(this._self, this._then);

  final SensorTrackingStateData _self;
  final $Res Function(SensorTrackingStateData) _then;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? remainingInSecond = null,
    Object? samples = null,
    Object? activityRecognized = freezed,
  }) {
    return _then(SensorTrackingStateData(
      remainingInSecond: null == remainingInSecond
          ? _self.remainingInSecond
          : remainingInSecond // ignore: cast_nullable_to_non_nullable
              as double,
      samples: null == samples
          ? _self.samples
          : samples // ignore: cast_nullable_to_non_nullable
              as int,
      activityRecognized: freezed == activityRecognized
          ? _self.activityRecognized
          : activityRecognized // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class SensorTrackingStateLoading implements SensorTrackingState {
  const SensorTrackingStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorTrackingStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SensorTrackingState.loading()';
  }
}

/// @nodoc

class SensorTrackingStateCompleted implements SensorTrackingState {
  const SensorTrackingStateCompleted(
      {required this.track, this.isUploading = false, this.error});

  final SensorTrack track;
  @JsonKey()
  final bool isUploading;
  final Object? error;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorTrackingStateCompletedCopyWith<SensorTrackingStateCompleted>
      get copyWith => _$SensorTrackingStateCompletedCopyWithImpl<
          SensorTrackingStateCompleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorTrackingStateCompleted &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, track, isUploading,
      const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'SensorTrackingState.completed(track: $track, isUploading: $isUploading, error: $error)';
  }
}

/// @nodoc
abstract mixin class $SensorTrackingStateCompletedCopyWith<$Res>
    implements $SensorTrackingStateCopyWith<$Res> {
  factory $SensorTrackingStateCompletedCopyWith(
          SensorTrackingStateCompleted value,
          $Res Function(SensorTrackingStateCompleted) _then) =
      _$SensorTrackingStateCompletedCopyWithImpl;
  @useResult
  $Res call({SensorTrack track, bool isUploading, Object? error});
}

/// @nodoc
class _$SensorTrackingStateCompletedCopyWithImpl<$Res>
    implements $SensorTrackingStateCompletedCopyWith<$Res> {
  _$SensorTrackingStateCompletedCopyWithImpl(this._self, this._then);

  final SensorTrackingStateCompleted _self;
  final $Res Function(SensorTrackingStateCompleted) _then;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? track = null,
    Object? isUploading = null,
    Object? error = freezed,
  }) {
    return _then(SensorTrackingStateCompleted(
      track: null == track
          ? _self.track
          : track // ignore: cast_nullable_to_non_nullable
              as SensorTrack,
      isUploading: null == isUploading
          ? _self.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _self.error : error,
    ));
  }
}

/// @nodoc

class SensorTrackingStateUploaded implements SensorTrackingState {
  const SensorTrackingStateUploaded({required this.track});

  final SensorTrack track;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorTrackingStateUploadedCopyWith<SensorTrackingStateUploaded>
      get copyWith => _$SensorTrackingStateUploadedCopyWithImpl<
          SensorTrackingStateUploaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorTrackingStateUploaded &&
            (identical(other.track, track) || other.track == track));
  }

  @override
  int get hashCode => Object.hash(runtimeType, track);

  @override
  String toString() {
    return 'SensorTrackingState.uploaded(track: $track)';
  }
}

/// @nodoc
abstract mixin class $SensorTrackingStateUploadedCopyWith<$Res>
    implements $SensorTrackingStateCopyWith<$Res> {
  factory $SensorTrackingStateUploadedCopyWith(
          SensorTrackingStateUploaded value,
          $Res Function(SensorTrackingStateUploaded) _then) =
      _$SensorTrackingStateUploadedCopyWithImpl;
  @useResult
  $Res call({SensorTrack track});
}

/// @nodoc
class _$SensorTrackingStateUploadedCopyWithImpl<$Res>
    implements $SensorTrackingStateUploadedCopyWith<$Res> {
  _$SensorTrackingStateUploadedCopyWithImpl(this._self, this._then);

  final SensorTrackingStateUploaded _self;
  final $Res Function(SensorTrackingStateUploaded) _then;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? track = null,
  }) {
    return _then(SensorTrackingStateUploaded(
      track: null == track
          ? _self.track
          : track // ignore: cast_nullable_to_non_nullable
              as SensorTrack,
    ));
  }
}

/// @nodoc

class SensorTrackingStateInitial implements SensorTrackingState {
  const SensorTrackingStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorTrackingStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SensorTrackingState.initial()';
  }
}

/// @nodoc

class SensorTrackingStateError implements SensorTrackingState {
  const SensorTrackingStateError(this.error, this.st);

  final Object error;
  final StackTrace st;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorTrackingStateErrorCopyWith<SensorTrackingStateError> get copyWith =>
      _$SensorTrackingStateErrorCopyWithImpl<SensorTrackingStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SensorTrackingStateError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @override
  String toString() {
    return 'SensorTrackingState.error(error: $error, st: $st)';
  }
}

/// @nodoc
abstract mixin class $SensorTrackingStateErrorCopyWith<$Res>
    implements $SensorTrackingStateCopyWith<$Res> {
  factory $SensorTrackingStateErrorCopyWith(SensorTrackingStateError value,
          $Res Function(SensorTrackingStateError) _then) =
      _$SensorTrackingStateErrorCopyWithImpl;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class _$SensorTrackingStateErrorCopyWithImpl<$Res>
    implements $SensorTrackingStateErrorCopyWith<$Res> {
  _$SensorTrackingStateErrorCopyWithImpl(this._self, this._then);

  final SensorTrackingStateError _self;
  final $Res Function(SensorTrackingStateError) _then;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(SensorTrackingStateError(
      null == error ? _self.error : error,
      null == st
          ? _self.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

// dart format on
