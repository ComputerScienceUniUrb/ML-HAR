import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/features/home/screens/records_list/records_screen.dart';
import 'package:go_router/go_router.dart';

class RecordsRoute extends GoRoute {
  RecordsRoute({super.routes})
      : super(
          path: 'records',
          builder: (context, state) => RecordsScreen(
            arguments: state.extra as RecordsArgumentsRoute,
          ),
        );
}

class RecordsArgumentsRoute {
  final List<ARData> records;
  final DateTime dateTime;

  RecordsArgumentsRoute({required this.records, required this.dateTime});
}
