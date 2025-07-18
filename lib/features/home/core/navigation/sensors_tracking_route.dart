import 'dart:convert';

import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/sensor_tracking.dart';
import 'package:go_router/go_router.dart';

class SensorsTrackingRoute extends GoRoute {
  SensorsTrackingRoute({super.routes})
      : super(
          path: 'sensors-tracking',
          builder: (context, state) {
            final configuration = state.extra as TestConfiguration;
            return SensorTrackingScreen(
              configuration: configuration,
            );
          },
        );
}

class RecordsArgumentsRoute {
  final List<ARData> records;
  final DateTime dateTime;

  RecordsArgumentsRoute({required this.records, required this.dateTime});
}

/// A codec that can serialize both [ComplexData1] and [ComplexData2].
class MyExtraCodec extends Codec<Object?, Object?> {
  /// Create a codec.
  const MyExtraCodec();

  @override
  Converter<Object?, Object?> get decoder => const _MyExtraDecoder();

  @override
  Converter<Object?, Object?> get encoder => const _MyExtraEncoder();
}

class _MyExtraDecoder extends Converter<Object?, Object?> {
  const _MyExtraDecoder();

  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    try {
      final list = input as List<Object>;
      if (list[0] == 'TestConfiguration') {
        return TestConfiguration.fromJson(list[1] as Map<String, dynamic>);
      } else if (list[0] == 'Experiment') {
        return Experiment.fromJson(list[1] as Map<String, dynamic>);
      }
    } catch (ex, st) {
      logger.e('MyExtraDecoder error', error: ex, stackTrace: st);
      rethrow;
    }
  }
}

class _MyExtraEncoder extends Converter<Object?, Object?> {
  const _MyExtraEncoder();

  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    switch (input) {
      case TestConfiguration _:
        return ['TestConfiguration', input.toJson()];
      case Experiment _:
        return ['Experiment', input.toJson()];
      default:
        throw FormatException('Cannot encode type ${input.runtimeType}');
    }
  }
}
