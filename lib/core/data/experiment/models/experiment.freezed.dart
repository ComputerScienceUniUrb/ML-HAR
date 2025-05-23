// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Experiment _$ExperimentFromJson(Map<String, dynamic> json) {
  return _Experiment.fromJson(json);
}

/// @nodoc
mixin _$Experiment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortCode => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  SensorActivityType? get activityTypeOverride =>
      throw _privateConstructorUsedError;
  SmartphonePosition? get smartphonePositionOverride =>
      throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  /// Serializes this Experiment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperimentCopyWith<Experiment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperimentCopyWith<$Res> {
  factory $ExperimentCopyWith(
          Experiment value, $Res Function(Experiment) then) =
      _$ExperimentCopyWithImpl<$Res, Experiment>;
  @useResult
  $Res call(
      {String id,
      String name,
      String shortCode,
      @TimestampConverter() DateTime createdAt,
      String? description,
      SensorActivityType? activityTypeOverride,
      SmartphonePosition? smartphonePositionOverride,
      int? duration,
      bool enabled});
}

/// @nodoc
class _$ExperimentCopyWithImpl<$Res, $Val extends Experiment>
    implements $ExperimentCopyWith<$Res> {
  _$ExperimentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortCode = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? activityTypeOverride = freezed,
    Object? smartphonePositionOverride = freezed,
    Object? duration = freezed,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      activityTypeOverride: freezed == activityTypeOverride
          ? _value.activityTypeOverride
          : activityTypeOverride // ignore: cast_nullable_to_non_nullable
              as SensorActivityType?,
      smartphonePositionOverride: freezed == smartphonePositionOverride
          ? _value.smartphonePositionOverride
          : smartphonePositionOverride // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperimentImplCopyWith<$Res>
    implements $ExperimentCopyWith<$Res> {
  factory _$$ExperimentImplCopyWith(
          _$ExperimentImpl value, $Res Function(_$ExperimentImpl) then) =
      __$$ExperimentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String shortCode,
      @TimestampConverter() DateTime createdAt,
      String? description,
      SensorActivityType? activityTypeOverride,
      SmartphonePosition? smartphonePositionOverride,
      int? duration,
      bool enabled});
}

/// @nodoc
class __$$ExperimentImplCopyWithImpl<$Res>
    extends _$ExperimentCopyWithImpl<$Res, _$ExperimentImpl>
    implements _$$ExperimentImplCopyWith<$Res> {
  __$$ExperimentImplCopyWithImpl(
      _$ExperimentImpl _value, $Res Function(_$ExperimentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortCode = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? activityTypeOverride = freezed,
    Object? smartphonePositionOverride = freezed,
    Object? duration = freezed,
    Object? enabled = null,
  }) {
    return _then(_$ExperimentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      activityTypeOverride: freezed == activityTypeOverride
          ? _value.activityTypeOverride
          : activityTypeOverride // ignore: cast_nullable_to_non_nullable
              as SensorActivityType?,
      smartphonePositionOverride: freezed == smartphonePositionOverride
          ? _value.smartphonePositionOverride
          : smartphonePositionOverride // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperimentImpl implements _Experiment {
  const _$ExperimentImpl(
      {required this.id,
      required this.name,
      required this.shortCode,
      @TimestampConverter() required this.createdAt,
      this.description,
      this.activityTypeOverride,
      this.smartphonePositionOverride,
      this.duration,
      this.enabled = false});

  factory _$ExperimentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperimentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String shortCode;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String? description;
  @override
  final SensorActivityType? activityTypeOverride;
  @override
  final SmartphonePosition? smartphonePositionOverride;
  @override
  final int? duration;
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'Experiment(id: $id, name: $name, shortCode: $shortCode, createdAt: $createdAt, description: $description, activityTypeOverride: $activityTypeOverride, smartphonePositionOverride: $smartphonePositionOverride, duration: $duration, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperimentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.activityTypeOverride, activityTypeOverride) ||
                other.activityTypeOverride == activityTypeOverride) &&
            (identical(other.smartphonePositionOverride,
                    smartphonePositionOverride) ||
                other.smartphonePositionOverride ==
                    smartphonePositionOverride) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      shortCode,
      createdAt,
      description,
      activityTypeOverride,
      smartphonePositionOverride,
      duration,
      enabled);

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperimentImplCopyWith<_$ExperimentImpl> get copyWith =>
      __$$ExperimentImplCopyWithImpl<_$ExperimentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperimentImplToJson(
      this,
    );
  }
}

abstract class _Experiment implements Experiment {
  const factory _Experiment(
      {required final String id,
      required final String name,
      required final String shortCode,
      @TimestampConverter() required final DateTime createdAt,
      final String? description,
      final SensorActivityType? activityTypeOverride,
      final SmartphonePosition? smartphonePositionOverride,
      final int? duration,
      final bool enabled}) = _$ExperimentImpl;

  factory _Experiment.fromJson(Map<String, dynamic> json) =
      _$ExperimentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get shortCode;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String? get description;
  @override
  SensorActivityType? get activityTypeOverride;
  @override
  SmartphonePosition? get smartphonePositionOverride;
  @override
  int? get duration;
  @override
  bool get enabled;

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperimentImplCopyWith<_$ExperimentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
