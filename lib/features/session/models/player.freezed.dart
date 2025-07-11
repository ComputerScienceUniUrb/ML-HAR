// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Player {
  String get id;
  @TimestampConverter()
  DateTime get subscribedOn;
  int? get age;
  double? get height;
  double? get weight;
  Gender? get gender;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<Player> get copyWith =>
      _$PlayerCopyWithImpl<Player>(this as Player, _$identity);

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Player &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscribedOn, subscribedOn) ||
                other.subscribedOn == subscribedOn) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, subscribedOn, age, height, weight, gender);

  @override
  String toString() {
    return 'Player(id: $id, subscribedOn: $subscribedOn, age: $age, height: $height, weight: $weight, gender: $gender)';
  }
}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) =
      _$PlayerCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @TimestampConverter() DateTime subscribedOn,
      int? age,
      double? height,
      double? weight,
      Gender? gender});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._self, this._then);

  final Player _self;
  final $Res Function(Player) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscribedOn = null,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscribedOn: null == subscribedOn
          ? _self.subscribedOn
          : subscribedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Player implements Player {
  const _Player(
      {required this.id,
      @TimestampConverter() required this.subscribedOn,
      this.age,
      this.height,
      this.weight,
      this.gender});
  factory _Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  @override
  final String id;
  @override
  @TimestampConverter()
  final DateTime subscribedOn;
  @override
  final int? age;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final Gender? gender;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlayerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Player &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscribedOn, subscribedOn) ||
                other.subscribedOn == subscribedOn) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, subscribedOn, age, height, weight, gender);

  @override
  String toString() {
    return 'Player(id: $id, subscribedOn: $subscribedOn, age: $age, height: $height, weight: $weight, gender: $gender)';
  }
}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) =
      __$PlayerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @TimestampConverter() DateTime subscribedOn,
      int? age,
      double? height,
      double? weight,
      Gender? gender});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(this._self, this._then);

  final _Player _self;
  final $Res Function(_Player) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? subscribedOn = null,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? gender = freezed,
  }) {
    return _then(_Player(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subscribedOn: null == subscribedOn
          ? _self.subscribedOn
          : subscribedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
    ));
  }
}

// dart format on
