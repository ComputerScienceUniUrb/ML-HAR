import 'package:aifit/constants.dart';
import 'package:aifit/core/clients/shared_preferences_client.dart';
import 'package:aifit/core/data/user/repository/user_repository_impl.dart';
import 'package:aifit/features/splash/application/splash_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  SplashState build() {
    _init();
    return const SplashStateLoading();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 1));

    final user = await ref.read(getUserRepositoryProvider).getUserInfo();
    final isIntroSeen = (await ref.read(getSharedPreferencesProvider.future))
            .getBool(introSeenKey) ??
        false;
    if (user.isSomethingMissing) {
      state = const SplashStateMissingUserInfo();
    } else {
      state = SplashStateLoaded(introSeen: isIntroSeen);
    }
  }
}
