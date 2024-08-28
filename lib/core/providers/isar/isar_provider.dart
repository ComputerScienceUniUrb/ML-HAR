import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> getIsar(GetIsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open([ARDataSchema, SensorTrackSchema], directory: dir.path);
}
