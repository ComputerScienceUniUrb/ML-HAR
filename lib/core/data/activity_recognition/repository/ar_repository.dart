import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/data/activity_recognition/sources/ar_activity_data_source.dart';
import 'package:aifit/core/data/activity_recognition/sources/ar_data_local_data_source.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';

abstract class ArRepository {
  Stream<Map<DateTime, List<ARData>>> getAggregatedDataByDay();

  Stream<List<ARData>> getDailyRecords();

  Stream<Activity> activityStream();

  Future<void> writeArData(Activity activity);
}
