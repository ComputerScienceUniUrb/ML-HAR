import 'package:aifit/core/data/user/models/gender.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/data/user/repository/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_details_notifier.g.dart';

@riverpod
class UserDetailsNotifier extends _$UserDetailsNotifier {
  @override
  UserInfo build() {
    getData();
    return const UserInfo();
  }

  Future<void> getData() async {
    final age = await ref.read(getUserRepositoryProvider).getUserAge();
    final height = await ref.read(getUserRepositoryProvider).getUserHeight();
    final weight = await ref.read(getUserRepositoryProvider).getUserWeight();
    final gender = await ref.read(getUserRepositoryProvider).getUserGender();

    state = UserInfo(
      age: age,
      weight: weight,
      gender: gender,
      height: height?.toInt(),
    );
  }

  setHeight(int? height) {
    if (height == null) return;
    state = state.copyWith(height: height);
    ref.read(getUserRepositoryProvider).setUserHeight(height);
  }

  setWeight(double? weight) {
    if (weight == null) return;
    state = state.copyWith(weight: weight);
    ref.read(getUserRepositoryProvider).setUserWeight(weight);
  }

  setAge(int? age) {
    if (age == null) return;
    state = state.copyWith(age: age);
    ref.read(getUserRepositoryProvider).setUserAge(age);
  }

  setGender(Gender? gender) {
    if (gender == null) return;
    state = state.copyWith(gender: gender);
    ref.read(getUserRepositoryProvider).setUserGender(gender);
  }
}
