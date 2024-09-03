import 'package:aifit/core/data/user/repository/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'height_notifier.g.dart';

@riverpod
class HeightNotifier extends _$HeightNotifier {
  @override
  int build() {
    getHeight();
    return 0;
  }

  getHeight() async {
    final h = await ref.read(getUserRepositoryProvider).getUserHeight();
    state = h?.toInt() ?? 0;
  }

  setHeight(int? height) {
    if (height == null) return;
    state = height;
    ref.read(getUserRepositoryProvider).setUserHeight(height);
  }
}
