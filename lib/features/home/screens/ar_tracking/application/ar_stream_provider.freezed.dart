// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ar_stream_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Activity? activity, DateTime? timestamp) data,
    required TResult Function() loading,
    required TResult Function() stop,
    required TResult Function(Object error, StackTrace st) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity? activity, DateTime? timestamp)? data,
    TResult? Function()? loading,
    TResult? Function()? stop,
    TResult? Function(Object error, StackTrace st)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity? activity, DateTime? timestamp)? data,
    TResult Function()? loading,
    TResult Function()? stop,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityStateData value) data,
    required TResult Function(ActivityStateLoading value) loading,
    required TResult Function(ActivityStateStop value) stop,
    required TResult Function(ActivityStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityStateData value)? data,
    TResult? Function(ActivityStateLoading value)? loading,
    TResult? Function(ActivityStateStop value)? stop,
    TResult? Function(ActivityStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityStateData value)? data,
    TResult Function(ActivityStateLoading value)? loading,
    TResult Function(ActivityStateStop value)? stop,
    TResult Function(ActivityStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityStateCopyWith<$Res> {
  factory $ActivityStateCopyWith(
          ActivityState value, $Res Function(ActivityState) then) =
      _$ActivityStateCopyWithImpl<$Res, ActivityState>;
}

/// @nodoc
class _$ActivityStateCopyWithImpl<$Res, $Val extends ActivityState>
    implements $ActivityStateCopyWith<$Res> {
  _$ActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ActivityStateDataImplCopyWith<$Res> {
  factory _$$ActivityStateDataImplCopyWith(_$ActivityStateDataImpl value,
          $Res Function(_$ActivityStateDataImpl) then) =
      __$$ActivityStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Activity? activity, DateTime? timestamp});
}

/// @nodoc
class __$$ActivityStateDataImplCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$ActivityStateDataImpl>
    implements _$$ActivityStateDataImplCopyWith<$Res> {
  __$$ActivityStateDataImplCopyWithImpl(_$ActivityStateDataImpl _value,
      $Res Function(_$ActivityStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$ActivityStateDataImpl(
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ActivityStateDataImpl implements ActivityStateData {
  const _$ActivityStateDataImpl({this.activity, this.timestamp});

  @override
  final Activity? activity;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'ActivityState.data(activity: $activity, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityStateDataImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, timestamp);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityStateDataImplCopyWith<_$ActivityStateDataImpl> get copyWith =>
      __$$ActivityStateDataImplCopyWithImpl<_$ActivityStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Activity? activity, DateTime? timestamp) data,
    required TResult Function() loading,
    required TResult Function() stop,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return data(activity, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity? activity, DateTime? timestamp)? data,
    TResult? Function()? loading,
    TResult? Function()? stop,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return data?.call(activity, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity? activity, DateTime? timestamp)? data,
    TResult Function()? loading,
    TResult Function()? stop,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(activity, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityStateData value) data,
    required TResult Function(ActivityStateLoading value) loading,
    required TResult Function(ActivityStateStop value) stop,
    required TResult Function(ActivityStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityStateData value)? data,
    TResult? Function(ActivityStateLoading value)? loading,
    TResult? Function(ActivityStateStop value)? stop,
    TResult? Function(ActivityStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityStateData value)? data,
    TResult Function(ActivityStateLoading value)? loading,
    TResult Function(ActivityStateStop value)? stop,
    TResult Function(ActivityStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ActivityStateData implements ActivityState {
  const factory ActivityStateData(
      {final Activity? activity,
      final DateTime? timestamp}) = _$ActivityStateDataImpl;

  Activity? get activity;
  DateTime? get timestamp;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityStateDataImplCopyWith<_$ActivityStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivityStateLoadingImplCopyWith<$Res> {
  factory _$$ActivityStateLoadingImplCopyWith(_$ActivityStateLoadingImpl value,
          $Res Function(_$ActivityStateLoadingImpl) then) =
      __$$ActivityStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActivityStateLoadingImplCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$ActivityStateLoadingImpl>
    implements _$$ActivityStateLoadingImplCopyWith<$Res> {
  __$$ActivityStateLoadingImplCopyWithImpl(_$ActivityStateLoadingImpl _value,
      $Res Function(_$ActivityStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActivityStateLoadingImpl implements ActivityStateLoading {
  const _$ActivityStateLoadingImpl();

  @override
  String toString() {
    return 'ActivityState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Activity? activity, DateTime? timestamp) data,
    required TResult Function() loading,
    required TResult Function() stop,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity? activity, DateTime? timestamp)? data,
    TResult? Function()? loading,
    TResult? Function()? stop,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity? activity, DateTime? timestamp)? data,
    TResult Function()? loading,
    TResult Function()? stop,
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
    required TResult Function(ActivityStateData value) data,
    required TResult Function(ActivityStateLoading value) loading,
    required TResult Function(ActivityStateStop value) stop,
    required TResult Function(ActivityStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityStateData value)? data,
    TResult? Function(ActivityStateLoading value)? loading,
    TResult? Function(ActivityStateStop value)? stop,
    TResult? Function(ActivityStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityStateData value)? data,
    TResult Function(ActivityStateLoading value)? loading,
    TResult Function(ActivityStateStop value)? stop,
    TResult Function(ActivityStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ActivityStateLoading implements ActivityState {
  const factory ActivityStateLoading() = _$ActivityStateLoadingImpl;
}

/// @nodoc
abstract class _$$ActivityStateStopImplCopyWith<$Res> {
  factory _$$ActivityStateStopImplCopyWith(_$ActivityStateStopImpl value,
          $Res Function(_$ActivityStateStopImpl) then) =
      __$$ActivityStateStopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActivityStateStopImplCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$ActivityStateStopImpl>
    implements _$$ActivityStateStopImplCopyWith<$Res> {
  __$$ActivityStateStopImplCopyWithImpl(_$ActivityStateStopImpl _value,
      $Res Function(_$ActivityStateStopImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ActivityStateStopImpl implements ActivityStateStop {
  const _$ActivityStateStopImpl();

  @override
  String toString() {
    return 'ActivityState.stop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActivityStateStopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Activity? activity, DateTime? timestamp) data,
    required TResult Function() loading,
    required TResult Function() stop,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity? activity, DateTime? timestamp)? data,
    TResult? Function()? loading,
    TResult? Function()? stop,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity? activity, DateTime? timestamp)? data,
    TResult Function()? loading,
    TResult Function()? stop,
    TResult Function(Object error, StackTrace st)? error,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityStateData value) data,
    required TResult Function(ActivityStateLoading value) loading,
    required TResult Function(ActivityStateStop value) stop,
    required TResult Function(ActivityStateError value) error,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityStateData value)? data,
    TResult? Function(ActivityStateLoading value)? loading,
    TResult? Function(ActivityStateStop value)? stop,
    TResult? Function(ActivityStateError value)? error,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityStateData value)? data,
    TResult Function(ActivityStateLoading value)? loading,
    TResult Function(ActivityStateStop value)? stop,
    TResult Function(ActivityStateError value)? error,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class ActivityStateStop implements ActivityState {
  const factory ActivityStateStop() = _$ActivityStateStopImpl;
}

/// @nodoc
abstract class _$$ActivityStateErrorImplCopyWith<$Res> {
  factory _$$ActivityStateErrorImplCopyWith(_$ActivityStateErrorImpl value,
          $Res Function(_$ActivityStateErrorImpl) then) =
      __$$ActivityStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace st});
}

/// @nodoc
class __$$ActivityStateErrorImplCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$ActivityStateErrorImpl>
    implements _$$ActivityStateErrorImplCopyWith<$Res> {
  __$$ActivityStateErrorImplCopyWithImpl(_$ActivityStateErrorImpl _value,
      $Res Function(_$ActivityStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? st = null,
  }) {
    return _then(_$ActivityStateErrorImpl(
      null == error ? _value.error : error,
      null == st
          ? _value.st
          : st // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ActivityStateErrorImpl implements ActivityStateError {
  const _$ActivityStateErrorImpl(this.error, this.st);

  @override
  final Object error;
  @override
  final StackTrace st;

  @override
  String toString() {
    return 'ActivityState.error(error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.st, st) || other.st == st));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error), st);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityStateErrorImplCopyWith<_$ActivityStateErrorImpl> get copyWith =>
      __$$ActivityStateErrorImplCopyWithImpl<_$ActivityStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Activity? activity, DateTime? timestamp) data,
    required TResult Function() loading,
    required TResult Function() stop,
    required TResult Function(Object error, StackTrace st) error,
  }) {
    return error(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Activity? activity, DateTime? timestamp)? data,
    TResult? Function()? loading,
    TResult? Function()? stop,
    TResult? Function(Object error, StackTrace st)? error,
  }) {
    return error?.call(this.error, st);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Activity? activity, DateTime? timestamp)? data,
    TResult Function()? loading,
    TResult Function()? stop,
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
    required TResult Function(ActivityStateData value) data,
    required TResult Function(ActivityStateLoading value) loading,
    required TResult Function(ActivityStateStop value) stop,
    required TResult Function(ActivityStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityStateData value)? data,
    TResult? Function(ActivityStateLoading value)? loading,
    TResult? Function(ActivityStateStop value)? stop,
    TResult? Function(ActivityStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityStateData value)? data,
    TResult Function(ActivityStateLoading value)? loading,
    TResult Function(ActivityStateStop value)? stop,
    TResult Function(ActivityStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ActivityStateError implements ActivityState {
  const factory ActivityStateError(final Object error, final StackTrace st) =
      _$ActivityStateErrorImpl;

  Object get error;
  StackTrace get st;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityStateErrorImplCopyWith<_$ActivityStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
