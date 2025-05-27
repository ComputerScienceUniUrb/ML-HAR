import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
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
    await Future.delayed(Duration.zero);

    final user = await ref.read(getUserRepositoryProvider).getUserInfo();
    if (user.isSomethingMissing) {
      state = const SplashStateMissingUserInfo();
    }else{
      state = const SplashStateLoaded();
    }
  }
}
