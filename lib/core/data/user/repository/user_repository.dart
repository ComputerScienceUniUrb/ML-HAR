import 'package:aifit/core/data/user/models/gender.dart';
import 'package:aifit/core/data/user/models/user_info.dart';

abstract class UserRepository {
  Future<double?> getUserHeight();

  Future<void> setUserHeight(double height);

  Future<int?> getUserAge();

  Future<Gender?> getUserGender();

  Future<void> setUserGender(Gender gender);

  Future<void> setUserAge(int age);

  Future<double?> getUserWeight();

  Future<UserInfo> getUserInfo();

  Future<void> setUserWeight(double weight);

  Future<void> clearAll();
}
