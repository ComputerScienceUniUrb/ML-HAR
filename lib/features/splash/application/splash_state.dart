import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {

  const factory SplashState.missingUserInfo() = SplashStateMissingUserInfo;
  const factory SplashState.loading() = SplashStateLoading;
  const factory SplashState.loaded({required bool introSeen}) = SplashStateLoaded;

}