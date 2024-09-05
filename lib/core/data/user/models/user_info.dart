import 'package:aifit/core/data/user/models/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    int? age,
    double? weight,
    Gender? gender,
    int? height,
  }) = _UserInfo;
}

extension UserInfoX on UserInfo {
  bool get isSomethingMissing {
    return age == null || weight == null || height == null || gender == null;
  }
}
