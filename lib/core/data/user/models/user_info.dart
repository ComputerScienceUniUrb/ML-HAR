import 'package:aifit/core/data/user/models/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'user_info.g.dart';

@embedded
class UserInfo {
  int? age;

  double? weight;

  @Enumerated(EnumType.name)
  Gender? gender;

  double? height;
}

extension UserInfoX on UserInfo {
  bool get isSomethingMissing {
    return age == null || weight == null || height == null || gender == null;
  }

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'weight': weight,
      'height': height,
      'gender': gender?.name,
    };
  }

  UserInfo copyWith({
    int? age,
    double? weight,
    Gender? gender,
    double? height,
  }) {
    final u = UserInfo();
    u.age = age ?? this.age;
    u.weight = weight ?? this.weight;
    u.gender = gender ?? this.gender;
    u.height = height ?? this.height;
    return u;
  }
}
