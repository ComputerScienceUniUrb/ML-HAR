import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StartDialog extends ConsumerWidget {
  final SmartphonePosition smartphonePosition;
  final SensorActivityType sensorActivityType;

  const StartDialog({
    required this.sensorActivityType,
    required this.smartphonePosition,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning,
              color: Colors.orange,
              size: 70,
            ),
            const SizedBox(height: 8),
            Text(
              getWarningText(smartphonePosition),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.pop(true);
              },
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }

  String getWarningText(SmartphonePosition position) {
    return switch (position) {
      SmartphonePosition.byHandPortrait =>
        'Tieni lo smartphone in mano in posizione portrait guardando lo schermo!',
      SmartphonePosition.pouch =>
        'Tieni lo smartphone nel marsupio con lo schermo rivolto '
            'verso l\'esterno e il connettore di ricarica verso destra!',
      SmartphonePosition.pocket =>
        'Tieni lo smartphone in tasca con lo schermo rivolto '
            'verso l\'esterno e il connettore di ricarica verso il basso!',
      _ => 'Nessun accorgimento particolare per questo test!'
    };
  }
}
