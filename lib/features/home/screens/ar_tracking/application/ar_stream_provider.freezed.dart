// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ar_stream_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivityState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivityState()';
  }
}

/// @nodoc
class $ActivityStateCopyWith<$Res> {
  $ActivityStateCopyWith(ActivityState _, $Res Function(ActivityState) __);
}

/// @nodoc

class ActivityStateData implements ActivityState {
  const ActivityStateData({this.activity, this.timestamp});

  final Activity? activity;
  final DateTime? timestamp;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityStateDataCopyWith<ActivityStateData> get copyWith =>
      _$ActivityStateDataCopyWithImpl<ActivityStateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityStateData &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, timestamp);

  @override
  String toString() {
    return 'ActivityState.data(activity: $activity, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ActivityStateDataCopyWith<$Res>
    implements $ActivityStateCopyWith<$Res> {
  factory $ActivityStateDataCopyWith(
          ActivityStateData value, $Res Function(ActivityStateData) _then) =
      _$ActivityStateDataCopyWithImpl;
  @useResult
  $Res call({Activity? activity, DateTime? timestamp});
}

/// @nodoc
class _$ActivityStateDataCopyWithImpl<$Res>
    implements $ActivityStateDataCopyWith<$Res> {
  _$ActivityStateDataCopyWithImpl(this._self, this._then);

  final ActivityStateData _self;
  final $Res Function(ActivityStateData) _then;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activity = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(ActivityStateData(
      activity: freezed == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class ActivityStateLoading implements ActivityState {
  const ActivityStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivityStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivityState.loading()';
  }
}

/// @nodoc

class ActivityStateStop implements ActivityState {
  const ActivityStateStop();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivityStateStop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivityState.stop()';
  }
}

/// @nodoc

class ActivityStateError implements ActivityState {
  const ActivityStateError(this.error, this.st);

  final Object error;
  final StackTrace st;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityStateErrorCopyWith<ActivityStateError> get copyWith =>
      _$ActivityStateErrorCopyWithImpl<ActivityStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityStateError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  @override
  String toString() {
    return 'ActivityState.error(error: $error, st: $st)';
  }
}

/// @nodoc
abstract mixin class $ActivityStateErrorCopyWith<$Res>
    implements $ActivityStateCopyWith<$Res> {
  factory $ActivityStateErrorCopyWith(
          ActivityStateError value, $Res Function(ActivityStateError) _then) =
      _$ActivityStateErrorCopyWithImpl;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class _$ActivityStateErrorCopyWithImpl<$Res>
    implements $ActivityStateErrorCopyWith<$Res> {
  _$ActivityStateErrorCopyWithImpl(this._self, this._then);

  final ActivityStateError _self;
  final $Res Function(ActivityStateError) _then;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(ActivityStateError(
      null == error ? _self.error : error,
      null == st
          ? _self.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

// dart format on
