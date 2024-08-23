import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ar_activity_data_source.g.dart';

@riverpod
ArActivityDataSource getArActivityDataSource(GetArActivityDataSourceRef ref) {
  return ArActivityDataSource();
}

class ArActivityDataSource {
  Stream<Activity> activityStream() {
    return FlutterActivityRecognition.instance.activityStream;
  }
}
