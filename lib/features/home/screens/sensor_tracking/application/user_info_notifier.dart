import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/data/user/repository/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_notifier.g.dart';

@riverpod
Future<UserInfo> getUserInfo(GetUserInfoRef ref) async {
  final age = await ref.read(getUserRepositoryProvider).getUserAge();
  final height = await ref.read(getUserRepositoryProvider).getUserHeight();
  final weight = await ref.read(getUserRepositoryProvider).getUserWeight();
  final gender = await ref.read(getUserRepositoryProvider).getUserGender();

  return UserInfo(
    age: age,
    weight: weight,
    gender: gender,
    height: height?.toInt(),
  );
}
