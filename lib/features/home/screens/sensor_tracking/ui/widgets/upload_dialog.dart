import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UploadDialog extends ConsumerWidget {
  const UploadDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sensorTrackingNotifierProvider);
    // if (state is! SensorTrackingStateCompleted) {
    //   return const SizedBox.shrink();
    // }
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: switch (state) {
          SensorTrackingStateCompleted(
            :final track,
            :final isUploading,
            :final error
          ) =>
            error != null
                ? const _ErrorWidget()
                : isUploading
                    ? const _LoadingWidget()
                    : const _TrackSavedWidget(),
          SensorTrackingStateUploaded(:final track) => const _UploadedWidget(),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(),
        ),
        SizedBox(height: 16),
        Text('Caricamento in corso'),
      ],
    );
  }
}

class _UploadedWidget extends StatelessWidget {
  const _UploadedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 70,
        ),
        SizedBox(height: 16),
        Text('File caricato con successo'),
      ],
    );
  }
}

class _ErrorWidget extends ConsumerWidget {
  const _ErrorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 70,
        ),
        const SizedBox(height: 16),
        const Text('Errore di caricamento'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: const Text('Esci'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(sensorTrackingNotifierProvider.notifier).uploadTrack();
              },
              child: const Text('Riprova'),
            ),
          ],
        ),
      ],
    );
  }
}

class _TrackSavedWidget extends ConsumerWidget {
  const _TrackSavedWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.warning,
          color: Colors.orange,
          size: 70,
        ),
        const SizedBox(height: 16),
        const Text(
          'Vuoi caricare il risultato in cloud?',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(sensorTrackingNotifierProvider.notifier).uploadTrack();
              },
              child: const Text('Upoload'),
            ),
          ],
        ),
      ],
    );
  }
}
