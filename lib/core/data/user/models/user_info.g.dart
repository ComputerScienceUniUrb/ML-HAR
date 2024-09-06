// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UserInfoSchema = Schema(
  name: r'UserInfo',
  id: 8636641989201795248,
  properties: {},
  estimateSize: _userInfoEstimateSize,
  serialize: _userInfoSerialize,
  deserialize: _userInfoDeserialize,
  deserializeProp: _userInfoDeserializeProp,
);

int _userInfoEstimateSize(
  UserInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _userInfoSerialize(
  UserInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
UserInfo _userInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserInfo();
  return object;
}

P _userInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension UserInfoQueryFilter
    on QueryBuilder<UserInfo, UserInfo, QFilterCondition> {}

extension UserInfoQueryObject
    on QueryBuilder<UserInfo, UserInfo, QFilterCondition> {}
