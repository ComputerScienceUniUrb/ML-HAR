// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivitySession {
  String get id;
  String get userId;
  String get name;
  @TimestampConverter()
  DateTime get createdAt;
  String? get runningId;
  String? get selectedExperimentId;
  String? get description;
  List<String> get experiments;
  SessionStatus get status;

  /// Create a copy of ActivitySession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivitySessionCopyWith<ActivitySession> get copyWith =>
      _$ActivitySessionCopyWithImpl<ActivitySession>(
          this as ActivitySession, _$identity);

  /// Serializes this ActivitySession to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivitySession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.runningId, runningId) ||
                other.runningId == runningId) &&
            (identical(other.selectedExperimentId, selectedExperimentId) ||
                other.selectedExperimentId == selectedExperimentId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.experiments, experiments) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      createdAt,
      runningId,
      selectedExperimentId,
      description,
      const DeepCollectionEquality().hash(experiments),
      status);

  @override
  String toString() {
    return 'ActivitySession(id: $id, userId: $userId, name: $name, createdAt: $createdAt, runningId: $runningId, selectedExperimentId: $selectedExperimentId, description: $description, experiments: $experiments, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ActivitySessionCopyWith<$Res> {
  factory $ActivitySessionCopyWith(
          ActivitySession value, $Res Function(ActivitySession) _then) =
      _$ActivitySessionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      @TimestampConverter() DateTime createdAt,
      String? runningId,
      String? selectedExperimentId,
      String? description,
      List<String> experiments,
      SessionStatus status});
}

/// @nodoc
class _$ActivitySessionCopyWithImpl<$Res>
    implements $ActivitySessionCopyWith<$Res> {
  _$ActivitySessionCopyWithImpl(this._self, this._then);

  final ActivitySession _self;
  final $Res Function(ActivitySession) _then;

  /// Create a copy of ActivitySession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? runningId = freezed,
    Object? selectedExperimentId = freezed,
    Object? description = freezed,
    Object? experiments = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      runningId: freezed == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedExperimentId: freezed == selectedExperimentId
          ? _self.selectedExperimentId
          : selectedExperimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      experiments: null == experiments
          ? _self.experiments
          : experiments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ActivitySession implements ActivitySession {
  const _ActivitySession(
      {required this.id,
      required this.userId,
      required this.name,
      @TimestampConverter() required this.createdAt,
      this.runningId,
      this.selectedExperimentId,
      this.description,
      final List<String> experiments = const [],
      this.status = SessionStatus.opened})
      : _experiments = experiments;
  factory _ActivitySession.fromJson(Map<String, dynamic> json) =>
      _$ActivitySessionFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String? runningId;
  @override
  final String? selectedExperimentId;
  @override
  final String? description;
  final List<String> _experiments;
  @override
  @JsonKey()
  List<String> get experiments {
    if (_experiments is EqualUnmodifiableListView) return _experiments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experiments);
  }

  @override
  @JsonKey()
  final SessionStatus status;

  /// Create a copy of ActivitySession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivitySessionCopyWith<_ActivitySession> get copyWith =>
      __$ActivitySessionCopyWithImpl<_ActivitySession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActivitySessionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivitySession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.runningId, runningId) ||
                other.runningId == runningId) &&
            (identical(other.selectedExperimentId, selectedExperimentId) ||
                other.selectedExperimentId == selectedExperimentId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._experiments, _experiments) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      createdAt,
      runningId,
      selectedExperimentId,
      description,
      const DeepCollectionEquality().hash(_experiments),
      status);

  @override
  String toString() {
    return 'ActivitySession(id: $id, userId: $userId, name: $name, createdAt: $createdAt, runningId: $runningId, selectedExperimentId: $selectedExperimentId, description: $description, experiments: $experiments, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ActivitySessionCopyWith<$Res>
    implements $ActivitySessionCopyWith<$Res> {
  factory _$ActivitySessionCopyWith(
          _ActivitySession value, $Res Function(_ActivitySession) _then) =
      __$ActivitySessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      @TimestampConverter() DateTime createdAt,
      String? runningId,
      String? selectedExperimentId,
      String? description,
      List<String> experiments,
      SessionStatus status});
}

/// @nodoc
class __$ActivitySessionCopyWithImpl<$Res>
    implements _$ActivitySessionCopyWith<$Res> {
  __$ActivitySessionCopyWithImpl(this._self, this._then);

  final _ActivitySession _self;
  final $Res Function(_ActivitySession) _then;

  /// Create a copy of ActivitySession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? runningId = freezed,
    Object? selectedExperimentId = freezed,
    Object? description = freezed,
    Object? experiments = null,
    Object? status = null,
  }) {
    return _then(_ActivitySession(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      runningId: freezed == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedExperimentId: freezed == selectedExperimentId
          ? _self.selectedExperimentId
          : selectedExperimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      experiments: null == experiments
          ? _self._experiments
          : experiments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
    ));
  }
}

// dart format on
