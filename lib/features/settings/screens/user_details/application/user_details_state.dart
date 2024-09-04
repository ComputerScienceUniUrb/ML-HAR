import 'package:aifit/core/data/user/models/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_state.freezed.dart';

@freezed
class UserDetailsState with _$UserDetailsState {
  const factory UserDetailsState({
    int? age,
    double? weight,
    Gender? gender,
    int? height,
  }) = _UserDetailsState;
}
