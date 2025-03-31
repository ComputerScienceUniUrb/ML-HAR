import 'package:aifit/core/data/user/models/gender.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/data/user/repository/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_details_notifier.g.dart';

@riverpod
class UserDetailsNotifier extends _$UserDetailsNotifier {
  @override
  Future<UserInfo> build() async {
    return getData();
  }

  Future<UserInfo> getData() async {
    final age = await ref.read(getUserRepositoryProvider).getUserAge();
    final height = await ref.read(getUserRepositoryProvider).getUserHeight();
    final weight = await ref.read(getUserRepositoryProvider).getUserWeight();
    final gender = await ref.read(getUserRepositoryProvider).getUserGender();

    final userInfo = UserInfo();
    userInfo.age = age;
    userInfo.weight = weight;
    userInfo.gender = gender;
    userInfo.height = height;
    return userInfo;
  }

  setHeight(double? height) async {
    if (height == null) return;
    final currentState = state;
    if (currentState is AsyncData) {
      state = AsyncData(currentState.requireValue.copyWith(height: height));
      await ref.read(getUserRepositoryProvider).setUserHeight(height);
    }
  }

  setWeight(double? weight) {
    if (weight == null) return;
    final currentState = state;
    if (currentState is AsyncData) {
      state = AsyncData(currentState.requireValue.copyWith(weight: weight));
      ref.read(getUserRepositoryProvider).setUserWeight(weight);
    }
  }

  setAge(int? age) {
    if (age == null) return;
    final currentState = state;
    if (currentState is AsyncData) {
      state = AsyncData(currentState.requireValue.copyWith(age: age));
      ref.read(getUserRepositoryProvider).setUserAge(age);
    }
  }

  setGender(Gender? gender) {
    if (gender == null) return;
    final currentState = state;
    if (currentState is AsyncData) {
      state = AsyncData(currentState.requireValue.copyWith(gender: gender));
      ref.read(getUserRepositoryProvider).setUserGender(gender);
    }
  }

  clearAll(){
    state = AsyncData(UserInfo());
    ref.read(getUserRepositoryProvider).clearAll();
  }
}
