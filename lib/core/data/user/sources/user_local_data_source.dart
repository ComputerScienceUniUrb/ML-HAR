import 'package:aifit/core/clients/shared_preferences_client.dart';
import 'package:aifit/core/data/user/models/gender.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_local_data_source.g.dart';

@riverpod
UserLocalDataSource getUserLocalDataSource(GetUserLocalDataSourceRef ref) {
  return UserLocalDataSource(ref: ref);
}

const userHeightKey = 'userHeight';
const userGenderKey = 'userGender';
const userAgeKey = 'userAge';
const userWeightKey = 'userWeight';

class UserLocalDataSource {
  final GetUserLocalDataSourceRef ref;

  UserLocalDataSource({required this.ref});

  Future<double?> getUserHeight() async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    return s.getDouble(userHeightKey);
  }

  Future<void> setUserHeight(int height) async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    s.setDouble(userHeightKey, height.toDouble());
  }

  Future<int?> getUserAge() async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    return s.getInt(userAgeKey);
  }

  Future<Gender?> getUserGender() async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    final gender = s.getString(userGenderKey);
    return gender == null || gender.isEmpty
        ? null
        : Gender.values.firstWhere((e) => gender == e.name);
  }

  Future<void> setUserAge(int age) async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    s.setInt(userAgeKey, age);
  }

  Future<void> setUserGender(Gender gender) async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    s.setString(userGenderKey, gender.name);
  }

  Future<double?> getUserWeight() async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    return s.getDouble(userWeightKey);
  }

  Future<void> setUserWeight(double weight) async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    s.setDouble(userWeightKey, weight);
  }
}
