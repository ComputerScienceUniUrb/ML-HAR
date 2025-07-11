import 'package:aifit/features/home/screens/sensor_tracking/application/experiment_notifier.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:aifit/features/session/application/session_notifier.dart';
import 'package:aifit/features/session/models/activity_session.dart';
import 'package:aifit/features/session/models/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveSessionWidget extends ConsumerWidget {
  final ActivitySession session;
  final Player player;

  const LiveSessionWidget({
    required this.session,
    required this.player,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session attiva'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (session.selectedExperimentId != null) ...[
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final experimentState = ref.watch(
                    getExperimentByIdProvider(session.selectedExperimentId!));
                return switch (experimentState) {
                  AsyncLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  AsyncData(:final value) => value == null
                      ? const SizedBox.shrink()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                                'Esperimento caricato con successo, siamo pronti,'),
                            Text(
                                'Il tuo numero identificativo è il ${player.id}'),
                            const Text(
                                'Segui le indicazioni dell\'operatore e preparati al test'),
                            const SizedBox(height: 8),
                            const Text('Siamo pronti per iniziare'),
                            Consumer(
                              builder: (
                                BuildContext context,
                                WidgetRef ref,
                                Widget? child,
                              ) {
                                final experiment = value;

                                ref.listen(
                                  getSessionsByIdProvider(session.id),
                                  (pre, next) {
                                    final preSession = pre?.valueOrNull;
                                    final nextSession = next.valueOrNull;

                                    if (preSession != null &&
                                        nextSession != null) {
                                      if (preSession.runningId != null &&
                                          nextSession.runningId == null) {
                                        ref
                                            .read(
                                              sensorTrackingNotifierProvider
                                                  .notifier,
                                            )
                                            .stop();
                                      } else if (preSession.runningId == null &&
                                          nextSession.runningId != null) {
                                        //TODO check runningId se già eseguito

                                        print('lancio esperimento');
                                        final duration = experiment.duration;
                                        final sensorActivityType =
                                            experiment.activityTypeOverride;
                                        final smartphonePosition = experiment
                                            .smartphonePositionOverride;
                                        if (duration != null &&
                                            sensorActivityType != null &&
                                            smartphonePosition != null) {
                                          ref
                                              .read(
                                                sensorTrackingNotifierProvider
                                                    .notifier,
                                              )
                                              .start(
                                                duration: duration,
                                                sensorActivityType:
                                                    sensorActivityType,
                                                smartphonePosition:
                                                    smartphonePosition,
                                                retainNullValue: true,
                                                experimentId: experiment.id,
                                                sessionId: session.id,
                                              );
                                        }
                                      }
                                    }
                                  },
                                );

                                final state =
                                    ref.watch(sensorTrackingNotifierProvider);

                                return CircleAvatar(
                                  radius: 100,
                                  child: Center(
                                    child: switch (state) {
                                      SensorTrackingStateData(
                                        :final samples,
                                        :final remainingInSecond,
                                        :final activityRecognized,
                                      ) =>
                                        Text('$remainingInSecond sec'),
                                      SensorTrackingStateLoading() =>
                                        const SizedBox.shrink(),
                                      SensorTrackingStateUploaded() =>
                                        const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                            Text('Caricamento completato'),
                                          ],
                                        ),
                                      SensorTrackingStateCompleted(
                                        :final track,
                                        :final isUploading,
                                        :final error
                                      ) =>
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (isUploading) ...[
                                              const CircularProgressIndicator(),
                                              const Text('Uploading traccia'),
                                            ] else ...[
                                              const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              ),
                                              const Text('Test completato'),
                                            ]
                                          ],
                                        ),
                                      _ => const Text('Attendi l\'avvio'),
                                    },
                                  ),
                                );
                                // // TODO fix null check
                                // return SensorTrackingWidget(
                                //   smartphonePosition:
                                //       experiment.smartphonePositionOverride!,
                                //   sensorActivityType:
                                //       experiment.activityTypeOverride!,
                                //   duration: experiment.duration!,
                                //   retainNullValue: false,
                                // );
                              },
                            ),
                            Text('${value.activityTypeOverride}'),
                            Text('${value.smartphonePositionOverride}')
                          ],
                        ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ],
        ],
      ),
    );
  }
}
