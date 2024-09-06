import 'dart:convert';
import 'dart:io';

import 'package:aifit/constants.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

mixin CSVMixin {
  Future<void> downloadCSV(SensorTrack track) async {
    final fileName = 'aifit_track_${DateTime.now().toIso8601String()}';
    // final file = await getCsv(list, fileName);
    final bytes = getCsvBytes(track, fileName);
    Share.shareXFiles([XFile.fromData(bytes, mimeType: 'csv')]);
  }

  String _buildCsv(SensorTrack track) {
    final data = track.sensorsData
        ?.map((e) => e.toCsvList(
              track.activityType,
              track.smartphonePosition,
              track.userInfo,
            ),)
        .toList();
    final csv = const ListToCsvConverter().convert([
      csvHeader,
      ...data ?? [],
    ]);
    return csv;
  }

  Uint8List getCsvBytes(SensorTrack track, String eventName) {
    final csv = _buildCsv(track);
    final bytes = Uint8List.fromList(utf8.encode(csv));
    return bytes;
  }

  Future<File?> getCsv(
    SensorTrack track,
    String filename,
    UserInfo userInfo,
  ) async {
    try {
      final csv = _buildCsv(track);

      final statuses = await [
        Permission.storage,
      ].request();
      if (await Permission.storage.isGranted) {
        final dir =
            '${(await getExternalStorageDirectory())!.path}/$filename.csv';

        final f = File(dir);

        await f.writeAsString(csv);
        return f;
      } else {
        final status = await Permission.storage.request();
        if (status == PermissionStatus.granted) {
          return getCsv(track, filename, userInfo);
        }
      }
      return null;
    } catch (ex) {
      logger.e(ex);
      return null;
    }
  }
}
