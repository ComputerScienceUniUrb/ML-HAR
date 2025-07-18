// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SplashState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashState()';
  }
}

/// @nodoc
class $SplashStateCopyWith<$Res> {
  $SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}

/// @nodoc

class SplashStateMissingUserInfo implements SplashState {
  const SplashStateMissingUserInfo();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashStateMissingUserInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashState.missingUserInfo()';
  }
}

/// @nodoc

class SplashStateLoading implements SplashState {
  const SplashStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SplashStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashState.loading()';
  }
}

/// @nodoc

class SplashStateLoaded implements SplashState {
  const SplashStateLoaded({required this.introSeen});

  final bool introSeen;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SplashStateLoadedCopyWith<SplashStateLoaded> get copyWith =>
      _$SplashStateLoadedCopyWithImpl<SplashStateLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashStateLoaded &&
            (identical(other.introSeen, introSeen) ||
                other.introSeen == introSeen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, introSeen);

  @override
  String toString() {
    return 'SplashState.loaded(introSeen: $introSeen)';
  }
}

/// @nodoc
abstract mixin class $SplashStateLoadedCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory $SplashStateLoadedCopyWith(
          SplashStateLoaded value, $Res Function(SplashStateLoaded) _then) =
      _$SplashStateLoadedCopyWithImpl;
  @useResult
  $Res call({bool introSeen});
}

/// @nodoc
class _$SplashStateLoadedCopyWithImpl<$Res>
    implements $SplashStateLoadedCopyWith<$Res> {
  _$SplashStateLoadedCopyWithImpl(this._self, this._then);

  final SplashStateLoaded _self;
  final $Res Function(SplashStateLoaded) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? introSeen = null,
  }) {
    return _then(SplashStateLoaded(
      introSeen: null == introSeen
          ? _self.introSeen
          : introSeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
