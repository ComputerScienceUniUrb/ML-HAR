import 'package:aifit/features/home/screens/sensor_tracking/application/sensor_tracks_provider.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/widgets/track_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllTracksScreen extends ConsumerWidget {
  const AllTracksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracks = ref.watch(getSensorTracksProvider).valueOrNull ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('All tracks'),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < tracks.length; i++)
            TrackTile(
              sensorTrack: tracks[i],
            ),
        ],
      ),
    );
  }
}
