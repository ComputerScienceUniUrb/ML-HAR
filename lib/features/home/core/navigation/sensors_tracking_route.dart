import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/sensor_tracking.dart';
import 'package:go_router/go_router.dart';

class SensorsTrackingRoute extends GoRoute {
  SensorsTrackingRoute({super.routes})
      : super(
          path: 'sensors-tracking',
          builder: (context, state){
            final configuration = state.extra as TestConfiguration;
            return SensorTrackingScreen(configuration: configuration,);
          },
        );
}

class RecordsArgumentsRoute {
  final List<ARData> records;
  final DateTime dateTime;

  RecordsArgumentsRoute({required this.records, required this.dateTime});
}
