import 'package:aifit/app/converters.dart';
import 'package:aifit/core/data/user/models/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.g.dart';

part 'player.freezed.dart';

@freezed
abstract class Player with _$Player {
  const factory Player({
    required String id,
    @TimestampConverter() required DateTime subscribedOn,
    int? age,
    double? height,
    double? weight,
    Gender? gender,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
