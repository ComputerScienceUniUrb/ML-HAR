import 'package:aifit/app/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_session.g.dart';
part 'activity_session.freezed.dart';


enum SessionStatus { draft, opened, live, closed }

@freezed
abstract class ActivitySession with _$ActivitySession {
  const factory ActivitySession({
    required String id,
    required String userId,
    required String name,
    @TimestampConverter() required DateTime createdAt,
    String? runningId,
    String? selectedExperimentId,
    String? description,
    @Default([]) List<String> experiments,
    @Default(SessionStatus.opened) SessionStatus status,
  }) = _ActivitySession;

  factory ActivitySession.fromJson(Map<String, dynamic> json) =>
      _$ActivitySessionFromJson(json);
}
