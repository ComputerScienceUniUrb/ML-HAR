import 'package:aifit/core/data/user/models/gender.dart';

class UserInfo {
  final int? age;

  final double? weight;

  final Gender? gender;

  final double? height;

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

  UserInfo({
   this.age,
   this.weight,
   this.gender,
   this.height,
  });

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      age: map['age'] as int?,
      weight: map['weight'] as double?,
      height: map['height'] as double?,
      gender: map['gender'] != null
          ? Gender.values.byName(map['gender'] as String)
          : null,
    );
  }

  UserInfo copyWith({
    int? age,
    double? weight,
    Gender? gender,
    double? height,
  }) {
    return UserInfo(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      height: height ?? this.height,
    );
  }
}
