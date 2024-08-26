import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/features/home/screens/sensor_tracking/sensor_tracking.dart';
import 'package:go_router/go_router.dart';

class SensorsTrackingRoute extends GoRoute {
  SensorsTrackingRoute() : super(
    path: 'sensors-tracking',
    builder: (context, state) => const SensorTrackingScreen(),
  );
}

class RecordsArgumentsRoute {
  final List<ARData> records;
  final DateTime dateTime;

  RecordsArgumentsRoute({required this.records, required this.dateTime});
}
