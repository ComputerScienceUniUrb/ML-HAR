import 'package:aifit/core/data/user/models/gender.dart';

abstract class UserRepository {
  Future<double?> getUserHeight();

  Future<void> setUserHeight(int height);

  Future<int?> getUserAge();

  Future<Gender?> getUserGender();

  Future<void> setUserGender(Gender gender);

  Future<void> setUserAge(int age);

  Future<double?> getUserWeight();

  Future<void> setUserWeight(double weight);
}
