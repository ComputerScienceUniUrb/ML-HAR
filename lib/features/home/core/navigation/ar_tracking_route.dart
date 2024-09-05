import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/features/home/screens/ar_tracking/ui/ar_tracking_screen.dart';
import 'package:go_router/go_router.dart';

class ARTrackingRoute extends GoRoute {
  ARTrackingRoute({super.routes})
      : super(
          path: 'ar-tracking',
          builder: (context, state) => const ARTrackingScreen(),
        );
}

class RecordsArgumentsRoute {
  final List<ARData> records;
  final DateTime dateTime;

  RecordsArgumentsRoute({required this.records, required this.dateTime});
}
