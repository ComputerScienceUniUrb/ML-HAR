import 'package:aifit/core/data/user/models/gender.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/data/user/repository/user_repository.dart';
import 'package:aifit/core/data/user/sources/user_local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_impl.g.dart';

@riverpod
UserRepository getUserRepository(GetUserRepositoryRef ref) {
  return UserRepositoryImpl(
    userLocalDataSource: ref.read(getUserLocalDataSourceProvider),
  );
}

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<double?> getUserHeight() {
    return userLocalDataSource.getUserHeight();
  }

  @override
  Future<void> setUserHeight(double height) {
    return userLocalDataSource.setUserHeight(height);
  }

  @override
  Future<int?> getUserAge() {
    return userLocalDataSource.getUserAge();
  }

  @override
  Future<Gender?> getUserGender() {
    return userLocalDataSource.getUserGender();
  }

  @override
  Future<void> setUserAge(int age) {
    return userLocalDataSource.setUserAge(age);
  }

  @override
  Future<void> setUserGender(Gender gender) {
    return userLocalDataSource.setUserGender(gender);
  }

  @override
  Future<double?> getUserWeight() {
    return userLocalDataSource.getUserWeight();
  }

  @override
  Future<void> setUserWeight(double weight) {
    return userLocalDataSource.setUserWeight(weight);
  }

  @override
  Future<void> clearAll() {
    return userLocalDataSource.clearAll();
  }

  @override
  Future<UserInfo> getUserInfo()async {
    final height = await getUserHeight();
    final age = await getUserAge();
    final gender = await getUserGender();
    final weight = await getUserWeight();

    final userInfo = UserInfo();
    userInfo.age = age;
    userInfo.weight = weight;
    userInfo.gender = gender;
    userInfo.height = height;
    return userInfo;
  }
}
