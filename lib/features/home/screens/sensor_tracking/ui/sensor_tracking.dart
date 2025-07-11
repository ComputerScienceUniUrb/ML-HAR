import 'dart:math';

import 'package:aifit/core/clients/device_info.dart';
import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/core/data/sensors/models/sensor_activity_type.dart';
import 'package:aifit/core/data/sensors/models/smartphone_position.dart';
import 'package:aifit/core/utils/csv_utils.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:aifit/core/utils/utils.dart';
import 'package:aifit/features/home/screens/load_experiment.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracks_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/all_tracks.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/widgets/start_dialog.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/widgets/track_tile.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/widgets/upload_dialog.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/widgets/user_info.dart';
import 'package:aifit/features/home/screens/track_viewer/track_viewer.dart';
import 'package:aifit/features/settings/screens/settings/settings_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class TestConfiguration extends Equatable {
  final Experiment? experiment;
  final SmartphonePosition smartphonePosition;
  final SensorActivityType sensorActivityType;
  final int duration;
  final bool retainNullValue;

  const TestConfiguration({
    required this.experiment,
    required this.smartphonePosition,
    required this.sensorActivityType,
    required this.duration,
    required this.retainNullValue,
  });

  @override
  List<Object?> get props => [
        experiment,
        smartphonePosition,
        sensorActivityType,
        duration,
        retainNullValue,
      ];
}

class SensorTrackingScreen extends ConsumerStatefulWidget {
  final TestConfiguration configuration;

  const SensorTrackingScreen({
    required this.configuration,
    super.key,
  });

  @override
  ConsumerState<SensorTrackingScreen> createState() =>
      _SensorTrackingScreenState();
}

class _SensorTrackingScreenState extends ConsumerState<SensorTrackingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.i('AppState $state');
    // if (state == AppLifecycleState.paused) {
    //   if (ref.exists(getSensorTracksProvider)) {
    //     ref.read(sensorTrackingNotifierProvider.notifier).stop();
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SensorTrackingWidget(
      experiment: widget.configuration.experiment,
      smartphonePosition: widget.configuration.smartphonePosition,
      sensorActivityType: widget.configuration.sensorActivityType,
      duration: widget.configuration.duration,
      retainNullValue: widget.configuration.retainNullValue,
    );
  }
}

class SensorTrackingWidget extends HookConsumerWidget {
  final Experiment? experiment;
  final SmartphonePosition smartphonePosition;
  final SensorActivityType sensorActivityType;
  final int duration;
  final bool retainNullValue;

  const SensorTrackingWidget({
    required this.smartphonePosition,
    required this.sensorActivityType,
    required this.duration,
    required this.retainNullValue,
    this.experiment,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(sensorTrackingNotifierProvider, (p, n) async {
      if (n is SensorTrackingStateCompleted &&
          !n.isUploading &&
          n.error == null) {
        await showDialog(
          context: context,
          builder: (_) => const UploadDialog(),
        );
      }
    });

    final state = ref.watch(sensorTrackingNotifierProvider);
    final isTracking = state is SensorTrackingStateData;
    final buttonText = !isTracking ? 'Start' : 'Stop';

    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          WakelockPlus.disable();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sensor Tracking'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const UserInfoWidget(),
            const SizedBox(height: 16),
            ExperimentInfo(
              name: experiment?.name,
              duration: experiment?.duration ?? duration,
              description: experiment?.description,
              activityType:
                  experiment?.activityTypeOverride ?? sensorActivityType,
              smartphonePosition:
                  experiment?.smartphonePositionOverride ?? smartphonePosition,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!isTracking) {
                  final isGranted = await isPermissionGrants();
                  if (isGranted) {
                    if (!context.mounted) return;
                    final res = await showDialog(
                      context: context,
                      builder: (_) => StartDialog(
                        smartphonePosition: smartphonePosition,
                        sensorActivityType: sensorActivityType,
                      ),
                    );
                    if (res ?? false) {
                      ref.read(sensorTrackingNotifierProvider.notifier).start(
                            duration: duration,
                            sensorActivityType: sensorActivityType,
                            smartphonePosition: smartphonePosition,
                            retainNullValue: retainNullValue,
                            experimentId: experiment?.id,
                          );
                    }
                  }
                } else {
                  ref.read(sensorTrackingNotifierProvider.notifier).stop();
                }
              },
              child: Text(buttonText),
            ),
            if (state is SensorTrackingStateData) ...[
              Center(
                child: Text(
                  '${state.remainingInSecond.toStringAsFixed(1)} sec',
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              Center(
                child: Text(
                  'Activity Recognition: ${state.activityRecognized ?? '-'}',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ] else if (state is SensorTrackingStateCompleted)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Current track'),
                      ...[
                        const SizedBox(height: 16),
                        Text('Id: ${state.track.id}'),
                        Text(
                          'Totali campioni: ${state.track.sensorsData?.length}',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    TrackViewerScreen(track: state.track),
                              ),
                            );
                          },
                          child: const Text('Vedi traccia'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final deviceInfo =
                                await ref.read(getDeviceInfoProvider.future);
                            downloadCSV(
                              state.track,
                              deviceInfo,
                            );
                          },
                          child: const Text('Scarica traccia'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            const SensorTracks(),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}

class SensorTracks extends ConsumerWidget {
  const SensorTracks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getSensorTracksProvider).valueOrNull ?? [];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tracks'),
                if (state.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AllTracksScreen(),
                        ),
                      );
                    },
                    child: const Text('View all'),
                  ),
              ],
            ),
            if (state.isNotEmpty)
              for (int i = 0; i < min(state.length, 5); i++)
                TrackTile(sensorTrack: state[i]),
          ],
        ),
      ),
    );
  }
}
