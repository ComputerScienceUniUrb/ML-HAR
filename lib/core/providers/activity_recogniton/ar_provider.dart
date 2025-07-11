import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ar_provider.g.dart';

@riverpod
FlutterActivityRecognition getARInstance(Ref ref) {
  return FlutterActivityRecognition.instance;
}
