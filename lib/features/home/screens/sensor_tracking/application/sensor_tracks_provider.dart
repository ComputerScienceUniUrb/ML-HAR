import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensor_tracks_provider.g.dart';

@riverpod
Stream<List<SensorTrack>> getSensorTracks(Ref ref) {
  return ref.read(getSensorsRepositoryProvider).getSensorTracks();
}
