import 'package:aifit/core/data/user/models/gender.dart';
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
  Future<void> setUserHeight(int height) {
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
}
