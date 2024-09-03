import 'package:aifit/core/clients/shared_preferences_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_local_data_source.g.dart';

@riverpod
UserLocalDataSource getUserLocalDataSource(GetUserLocalDataSourceRef ref) {
  return UserLocalDataSource(ref: ref);
}

const userHeightKey = 'userHeight';

class UserLocalDataSource {
  final GetUserLocalDataSourceRef ref;

  UserLocalDataSource({required this.ref});

  Future<double?> getUserHeight() async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    return s.getDouble('userHeight');
  }

  Future<void> setUserHeight(int height) async {
    final s = await ref.read(getSharedPreferencesProvider.future);
    s.setDouble(userHeightKey, height.toDouble());
  }
}
