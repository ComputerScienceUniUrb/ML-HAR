// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SensorTrackingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)
        data,
    required TResult Function() loading,
    required TResult Function(
            SensorTrack track, bool isUploading, Object? error)
        completed,
    required TResult Function(SensorTrack track) uploaded,
    required TResult Function() initial,
    required TResult Function(Object error, StackTrace st) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult? Function()? loading,
    TResult? Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult? Function(SensorTrack track)? uploaded,
    TResult? Function()? initial,
    TResult? Function(Object error, StackTrace st)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult Function()? loading,
    TResult Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult Function(SensorTrack track)? uploaded,
    TResult Function()? initial,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SensorTrackingStateData value) data,
    required TResult Function(SensorTrackingStateLoading value) loading,
    required TResult Function(SensorTrackingStateCompleted value) completed,
    required TResult Function(SensorTrackingStateUploaded value) uploaded,
    required TResult Function(SensorTrackingStateInitial value) initial,
    required TResult Function(SensorTrackingStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SensorTrackingStateData value)? data,
    TResult? Function(SensorTrackingStateLoading value)? loading,
    TResult? Function(SensorTrackingStateCompleted value)? completed,
    TResult? Function(SensorTrackingStateUploaded value)? uploaded,
    TResult? Function(SensorTrackingStateInitial value)? initial,
    TResult? Function(SensorTrackingStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SensorTrackingStateData value)? data,
    TResult Function(SensorTrackingStateLoading value)? loading,
    TResult Function(SensorTrackingStateCompleted value)? completed,
    TResult Function(SensorTrackingStateUploaded value)? uploaded,
    TResult Function(SensorTrackingStateInitial value)? initial,
    TResult Function(SensorTrackingStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorTrackingStateCopyWith<$Res> {
  factory $SensorTrackingStateCopyWith(
          SensorTrackingState value, $Res Function(SensorTrackingState) then) =
      _$SensorTrackingStateCopyWithImpl<$Res, SensorTrackingState>;
}

/// @nodoc
class _$SensorTrackingStateCopyWithImpl<$Res, $Val extends SensorTrackingState>
    implements $SensorTrackingStateCopyWith<$Res> {
  _$SensorTrackingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SensorTrackingStateDataImplCopyWith<$Res> {
  factory _$$SensorTrackingStateDataImplCopyWith(
          _$SensorTrackingStateDataImpl value,
          $Res Function(_$SensorTrackingStateDataImpl) then) =
      __$$SensorTrackingStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double remainingInSecond, int samples, String? activityRecognized});
}

/// @nodoc
class __$$SensorTrackingStateDataImplCopyWithImpl<$Res>
    extends _$SensorTrackingStateCopyWithImpl<$Res,
        _$SensorTrackingStateDataImpl>
    implements _$$SensorTrackingStateDataImplCopyWith<$Res> {
  __$$SensorTrackingStateDataImplCopyWithImpl(
      _$SensorTrackingStateDataImpl _value,
      $Res Function(_$SensorTrackingStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingInSecond = null,
    Object? samples = null,
    Object? activityRecognized = freezed,
  }) {
    return _then(_$SensorTrackingStateDataImpl(
      remainingInSecond: null == remainingInSecond
          ? _value.remainingInSecond
          : remainingInSecond // ignore: cast_nullable_to_non_nullable
              as double,
      samples: null == samples
          ? _value.samples
          : samples // ignore: cast_nullable_to_non_nullable
              as int,
      activityRecognized: freezed == activityRecognized
          ? _value.activityRecognized
          : activityRecognized // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SensorTrackingStateDataImpl implements SensorTrackingStateData {
  const _$SensorTrackingStateDataImpl(
      {required this.remainingInSecond,
      required this.samples,
      this.activityRecognized});

  @override
  final double remainingInSecond;
  @override
  final int samples;
  @override
  final String? activityRecognized;

  @override
  String toString() {
    return 'SensorTrackingState.data(remainingInSecond: $remainingInSecond, samples: $samples, activityRecognized: $activityRecognized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorTrackingStateDataImpl &&
            (identical(other.remainingInSecond, remainingInSecond) ||
                other.remainingInSecond == remainingInSecond) &&
            (identical(other.samples, samples) || other.samples == samples) &&
            (identical(other.activityRecognized, activityRecognized) ||
                other.activityRecognized == activityRecognized));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remainingInSecond, samples, activityRecognized);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorTrackingStateDataImplCopyWith<_$SensorTrackingStateDataImpl>
      get copyWith => __$$SensorTrackingStateDataImplCopyWithImpl<
          _$SensorTrackingStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)
        data,
    required TResult Function() loading,
    required TResult Function(
            SensorTrack track, bool isUploading, Object? error)
        completed,
    required TResult Function(SensorTrack track) uploaded,
    required TResult Function() initial,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return data(remainingInSecond, samples, activityRecognized);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult? Function()? loading,
    TResult? Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult? Function(SensorTrack track)? uploaded,
    TResult? Function()? initial,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return data?.call(remainingInSecond, samples, activityRecognized);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult Function()? loading,
    TResult Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult Function(SensorTrack track)? uploaded,
    TResult Function()? initial,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(remainingInSecond, samples, activityRecognized);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SensorTrackingStateData value) data,
    required TResult Function(SensorTrackingStateLoading value) loading,
    required TResult Function(SensorTrackingStateCompleted value) completed,
    required TResult Function(SensorTrackingStateUploaded value) uploaded,
    required TResult Function(SensorTrackingStateInitial value) initial,
    required TResult Function(SensorTrackingStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SensorTrackingStateData value)? data,
    TResult? Function(SensorTrackingStateLoading value)? loading,
    TResult? Function(SensorTrackingStateCompleted value)? completed,
    TResult? Function(SensorTrackingStateUploaded value)? uploaded,
    TResult? Function(SensorTrackingStateInitial value)? initial,
    TResult? Function(SensorTrackingStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SensorTrackingStateData value)? data,
    TResult Function(SensorTrackingStateLoading value)? loading,
    TResult Function(SensorTrackingStateCompleted value)? completed,
    TResult Function(SensorTrackingStateUploaded value)? uploaded,
    TResult Function(SensorTrackingStateInitial value)? initial,
    TResult Function(SensorTrackingStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class SensorTrackingStateData implements SensorTrackingState {
  const factory SensorTrackingStateData(
      {required final double remainingInSecond,
      required final int samples,
      final String? activityRecognized}) = _$SensorTrackingStateDataImpl;

  double get remainingInSecond;
  int get samples;
  String? get activityRecognized;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SensorTrackingStateDataImplCopyWith<_$SensorTrackingStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SensorTrackingStateLoadingImplCopyWith<$Res> {
  factory _$$SensorTrackingStateLoadingImplCopyWith(
          _$SensorTrackingStateLoadingImpl value,
          $Res Function(_$SensorTrackingStateLoadingImpl) then) =
      __$$SensorTrackingStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SensorTrackingStateLoadingImplCopyWithImpl<$Res>
    extends _$SensorTrackingStateCopyWithImpl<$Res,
        _$SensorTrackingStateLoadingImpl>
    implements _$$SensorTrackingStateLoadingImplCopyWith<$Res> {
  __$$SensorTrackingStateLoadingImplCopyWithImpl(
      _$SensorTrackingStateLoadingImpl _value,
      $Res Function(_$SensorTrackingStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SensorTrackingStateLoadingImpl implements SensorTrackingStateLoading {
  const _$SensorTrackingStateLoadingImpl();

  @override
  String toString() {
    return 'SensorTrackingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorTrackingStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)
        data,
    required TResult Function() loading,
    required TResult Function(
            SensorTrack track, bool isUploading, Object? error)
        completed,
    required TResult Function(SensorTrack track) uploaded,
    required TResult Function() initial,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult? Function()? loading,
    TResult? Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult? Function(SensorTrack track)? uploaded,
    TResult? Function()? initial,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult Function()? loading,
    TResult Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult Function(SensorTrack track)? uploaded,
    TResult Function()? initial,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SensorTrackingStateData value) data,
    required TResult Function(SensorTrackingStateLoading value) loading,
    required TResult Function(SensorTrackingStateCompleted value) completed,
    required TResult Function(SensorTrackingStateUploaded value) uploaded,
    required TResult Function(SensorTrackingStateInitial value) initial,
    required TResult Function(SensorTrackingStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SensorTrackingStateData value)? data,
    TResult? Function(SensorTrackingStateLoading value)? loading,
    TResult? Function(SensorTrackingStateCompleted value)? completed,
    TResult? Function(SensorTrackingStateUploaded value)? uploaded,
    TResult? Function(SensorTrackingStateInitial value)? initial,
    TResult? Function(SensorTrackingStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SensorTrackingStateData value)? data,
    TResult Function(SensorTrackingStateLoading value)? loading,
    TResult Function(SensorTrackingStateCompleted value)? completed,
    TResult Function(SensorTrackingStateUploaded value)? uploaded,
    TResult Function(SensorTrackingStateInitial value)? initial,
    TResult Function(SensorTrackingStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SensorTrackingStateLoading implements SensorTrackingState {
  const factory SensorTrackingStateLoading() = _$SensorTrackingStateLoadingImpl;
}

/// @nodoc
abstract class _$$SensorTrackingStateCompletedImplCopyWith<$Res> {
  factory _$$SensorTrackingStateCompletedImplCopyWith(
          _$SensorTrackingStateCompletedImpl value,
          $Res Function(_$SensorTrackingStateCompletedImpl) then) =
      __$$SensorTrackingStateCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SensorTrack track, bool isUploading, Object? error});
}

/// @nodoc
class __$$SensorTrackingStateCompletedImplCopyWithImpl<$Res>
    extends _$SensorTrackingStateCopyWithImpl<$Res,
        _$SensorTrackingStateCompletedImpl>
    implements _$$SensorTrackingStateCompletedImplCopyWith<$Res> {
  __$$SensorTrackingStateCompletedImplCopyWithImpl(
      _$SensorTrackingStateCompletedImpl _value,
      $Res Function(_$SensorTrackingStateCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track = null,
    Object? isUploading = null,
    Object? error = freezed,
  }) {
    return _then(_$SensorTrackingStateCompletedImpl(
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as SensorTrack,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SensorTrackingStateCompletedImpl
    implements SensorTrackingStateCompleted {
  const _$SensorTrackingStateCompletedImpl(
      {required this.track, this.isUploading = false, this.error});

  @override
  final SensorTrack track;
  @override
  @JsonKey()
  final bool isUploading;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SensorTrackingState.completed(track: $track, isUploading: $isUploading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorTrackingStateCompletedImpl &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, track, isUploading,
      const DeepCollectionEquality().hash(error));

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorTrackingStateCompletedImplCopyWith<
          _$SensorTrackingStateCompletedImpl>
      get copyWith => __$$SensorTrackingStateCompletedImplCopyWithImpl<
          _$SensorTrackingStateCompletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)
        data,
    required TResult Function() loading,
    required TResult Function(
            SensorTrack track, bool isUploading, Object? error)
        completed,
    required TResult Function(SensorTrack track) uploaded,
    required TResult Function() initial,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return completed(track, isUploading, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult? Function()? loading,
    TResult? Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult? Function(SensorTrack track)? uploaded,
    TResult? Function()? initial,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return completed?.call(track, isUploading, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult Function()? loading,
    TResult Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult Function(SensorTrack track)? uploaded,
    TResult Function()? initial,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(track, isUploading, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SensorTrackingStateData value) data,
    required TResult Function(SensorTrackingStateLoading value) loading,
    required TResult Function(SensorTrackingStateCompleted value) completed,
    required TResult Function(SensorTrackingStateUploaded value) uploaded,
    required TResult Function(SensorTrackingStateInitial value) initial,
    required TResult Function(SensorTrackingStateError value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SensorTrackingStateData value)? data,
    TResult? Function(SensorTrackingStateLoading value)? loading,
    TResult? Function(SensorTrackingStateCompleted value)? completed,
    TResult? Function(SensorTrackingStateUploaded value)? uploaded,
    TResult? Function(SensorTrackingStateInitial value)? initial,
    TResult? Function(SensorTrackingStateError value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SensorTrackingStateData value)? data,
    TResult Function(SensorTrackingStateLoading value)? loading,
    TResult Function(SensorTrackingStateCompleted value)? completed,
    TResult Function(SensorTrackingStateUploaded value)? uploaded,
    TResult Function(SensorTrackingStateInitial value)? initial,
    TResult Function(SensorTrackingStateError value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class SensorTrackingStateCompleted implements SensorTrackingState {
  const factory SensorTrackingStateCompleted(
      {required final SensorTrack track,
      final bool isUploading,
      final Object? error}) = _$SensorTrackingStateCompletedImpl;

  SensorTrack get track;
  bool get isUploading;
  Object? get error;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SensorTrackingStateCompletedImplCopyWith<
          _$SensorTrackingStateCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SensorTrackingStateUploadedImplCopyWith<$Res> {
  factory _$$SensorTrackingStateUploadedImplCopyWith(
          _$SensorTrackingStateUploadedImpl value,
          $Res Function(_$SensorTrackingStateUploadedImpl) then) =
      __$$SensorTrackingStateUploadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SensorTrack track});
}

/// @nodoc
class __$$SensorTrackingStateUploadedImplCopyWithImpl<$Res>
    extends _$SensorTrackingStateCopyWithImpl<$Res,
        _$SensorTrackingStateUploadedImpl>
    implements _$$SensorTrackingStateUploadedImplCopyWith<$Res> {
  __$$SensorTrackingStateUploadedImplCopyWithImpl(
      _$SensorTrackingStateUploadedImpl _value,
      $Res Function(_$SensorTrackingStateUploadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track = null,
  }) {
    return _then(_$SensorTrackingStateUploadedImpl(
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as SensorTrack,
    ));
  }
}

/// @nodoc

class _$SensorTrackingStateUploadedImpl implements SensorTrackingStateUploaded {
  const _$SensorTrackingStateUploadedImpl({required this.track});

  @override
  final SensorTrack track;

  @override
  String toString() {
    return 'SensorTrackingState.uploaded(track: $track)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorTrackingStateUploadedImpl &&
            (identical(other.track, track) || other.track == track));
  }

  @override
  int get hashCode => Object.hash(runtimeType, track);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorTrackingStateUploadedImplCopyWith<_$SensorTrackingStateUploadedImpl>
      get copyWith => __$$SensorTrackingStateUploadedImplCopyWithImpl<
          _$SensorTrackingStateUploadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)
        data,
    required TResult Function() loading,
    required TResult Function(
            SensorTrack track, bool isUploading, Object? error)
        completed,
    required TResult Function(SensorTrack track) uploaded,
    required TResult Function() initial,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return uploaded(track);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult? Function()? loading,
    TResult? Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult? Function(SensorTrack track)? uploaded,
    TResult? Function()? initial,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return uploaded?.call(track);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult Function()? loading,
    TResult Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult Function(SensorTrack track)? uploaded,
    TResult Function()? initial,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(track);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SensorTrackingStateData value) data,
    required TResult Function(SensorTrackingStateLoading value) loading,
    required TResult Function(SensorTrackingStateCompleted value) completed,
    required TResult Function(SensorTrackingStateUploaded value) uploaded,
    required TResult Function(SensorTrackingStateInitial value) initial,
    required TResult Function(SensorTrackingStateError value) error,
  }) {
    return uploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SensorTrackingStateData value)? data,
    TResult? Function(SensorTrackingStateLoading value)? loading,
    TResult? Function(SensorTrackingStateCompleted value)? completed,
    TResult? Function(SensorTrackingStateUploaded value)? uploaded,
    TResult? Function(SensorTrackingStateInitial value)? initial,
    TResult? Function(SensorTrackingStateError value)? error,
  }) {
    return uploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SensorTrackingStateData value)? data,
    TResult Function(SensorTrackingStateLoading value)? loading,
    TResult Function(SensorTrackingStateCompleted value)? completed,
    TResult Function(SensorTrackingStateUploaded value)? uploaded,
    TResult Function(SensorTrackingStateInitial value)? initial,
    TResult Function(SensorTrackingStateError value)? error,
    required TResult orElse(),
  }) {
    if (uploaded != null) {
      return uploaded(this);
    }
    return orElse();
  }
}

abstract class SensorTrackingStateUploaded implements SensorTrackingState {
  const factory SensorTrackingStateUploaded(
      {required final SensorTrack track}) = _$SensorTrackingStateUploadedImpl;

  SensorTrack get track;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SensorTrackingStateUploadedImplCopyWith<_$SensorTrackingStateUploadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SensorTrackingStateInitialImplCopyWith<$Res> {
  factory _$$SensorTrackingStateInitialImplCopyWith(
          _$SensorTrackingStateInitialImpl value,
          $Res Function(_$SensorTrackingStateInitialImpl) then) =
      __$$SensorTrackingStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SensorTrackingStateInitialImplCopyWithImpl<$Res>
    extends _$SensorTrackingStateCopyWithImpl<$Res,
        _$SensorTrackingStateInitialImpl>
    implements _$$SensorTrackingStateInitialImplCopyWith<$Res> {
  __$$SensorTrackingStateInitialImplCopyWithImpl(
      _$SensorTrackingStateInitialImpl _value,
      $Res Function(_$SensorTrackingStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SensorTrackingStateInitialImpl implements SensorTrackingStateInitial {
  const _$SensorTrackingStateInitialImpl();

  @override
  String toString() {
    return 'SensorTrackingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorTrackingStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)
        data,
    required TResult Function() loading,
    required TResult Function(
            SensorTrack track, bool isUploading, Object? error)
        completed,
    required TResult Function(SensorTrack track) uploaded,
    required TResult Function() initial,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult? Function()? loading,
    TResult? Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult? Function(SensorTrack track)? uploaded,
    TResult? Function()? initial,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult Function()? loading,
    TResult Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult Function(SensorTrack track)? uploaded,
    TResult Function()? initial,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SensorTrackingStateData value) data,
    required TResult Function(SensorTrackingStateLoading value) loading,
    required TResult Function(SensorTrackingStateCompleted value) completed,
    required TResult Function(SensorTrackingStateUploaded value) uploaded,
    required TResult Function(SensorTrackingStateInitial value) initial,
    required TResult Function(SensorTrackingStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SensorTrackingStateData value)? data,
    TResult? Function(SensorTrackingStateLoading value)? loading,
    TResult? Function(SensorTrackingStateCompleted value)? completed,
    TResult? Function(SensorTrackingStateUploaded value)? uploaded,
    TResult? Function(SensorTrackingStateInitial value)? initial,
    TResult? Function(SensorTrackingStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SensorTrackingStateData value)? data,
    TResult Function(SensorTrackingStateLoading value)? loading,
    TResult Function(SensorTrackingStateCompleted value)? completed,
    TResult Function(SensorTrackingStateUploaded value)? uploaded,
    TResult Function(SensorTrackingStateInitial value)? initial,
    TResult Function(SensorTrackingStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SensorTrackingStateInitial implements SensorTrackingState {
  const factory SensorTrackingStateInitial() = _$SensorTrackingStateInitialImpl;
}

/// @nodoc
abstract class _$$SensorTrackingStateErrorImplCopyWith<$Res> {
  factory _$$SensorTrackingStateErrorImplCopyWith(
          _$SensorTrackingStateErrorImpl value,
          $Res Function(_$SensorTrackingStateErrorImpl) then) =
      __$$SensorTrackingStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$SensorTrackingStateErrorImplCopyWithImpl<$Res>
    extends _$SensorTrackingStateCopyWithImpl<$Res,
        _$SensorTrackingStateErrorImpl>
    implements _$$SensorTrackingStateErrorImplCopyWith<$Res> {
  __$$SensorTrackingStateErrorImplCopyWithImpl(
      _$SensorTrackingStateErrorImpl _value,
      $Res Function(_$SensorTrackingStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$SensorTrackingStateErrorImpl(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$SensorTrackingStateErrorImpl implements SensorTrackingStateError {
  const _$SensorTrackingStateErrorImpl(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'SensorTrackingState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorTrackingStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorTrackingStateErrorImplCopyWith<_$SensorTrackingStateErrorImpl>
      get copyWith => __$$SensorTrackingStateErrorImplCopyWithImpl<
          _$SensorTrackingStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)
        data,
    required TResult Function() loading,
    required TResult Function(
            SensorTrack track, bool isUploading, Object? error)
        completed,
    required TResult Function(SensorTrack track) uploaded,
    required TResult Function() initial,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return error(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult? Function()? loading,
    TResult? Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult? Function(SensorTrack track)? uploaded,
    TResult? Function()? initial,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return error?.call(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double remainingInSecond, int samples, String? activityRecognized)?
        data,
    TResult Function()? loading,
    TResult Function(SensorTrack track, bool isUploading, Object? error)?
        completed,
    TResult Function(SensorTrack track)? uploaded,
    TResult Function()? initial,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, st);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SensorTrackingStateData value) data,
    required TResult Function(SensorTrackingStateLoading value) loading,
    required TResult Function(SensorTrackingStateCompleted value) completed,
    required TResult Function(SensorTrackingStateUploaded value) uploaded,
    required TResult Function(SensorTrackingStateInitial value) initial,
    required TResult Function(SensorTrackingStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SensorTrackingStateData value)? data,
    TResult? Function(SensorTrackingStateLoading value)? loading,
    TResult? Function(SensorTrackingStateCompleted value)? completed,
    TResult? Function(SensorTrackingStateUploaded value)? uploaded,
    TResult? Function(SensorTrackingStateInitial value)? initial,
    TResult? Function(SensorTrackingStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SensorTrackingStateData value)? data,
    TResult Function(SensorTrackingStateLoading value)? loading,
    TResult Function(SensorTrackingStateCompleted value)? completed,
    TResult Function(SensorTrackingStateUploaded value)? uploaded,
    TResult Function(SensorTrackingStateInitial value)? initial,
    TResult Function(SensorTrackingStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SensorTrackingStateError implements SensorTrackingState {
  const factory SensorTrackingStateError(
      final Object error, final StackTrace st) = _$SensorTrackingStateErrorImpl;

  Object get error;
  StackTrace get st;

  /// Create a copy of SensorTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SensorTrackingStateErrorImplCopyWith<_$SensorTrackingStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
