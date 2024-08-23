import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ar_provider.g.dart';

@riverpod
FlutterActivityRecognition getARInstance(GetARInstanceRef ref) {
  return FlutterActivityRecognition.instance;
}
