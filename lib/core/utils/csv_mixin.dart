import 'dart:convert';
import 'dart:io';

import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

mixin CSVMixin {
  Future<void> downloadCSV(SensorTrack track, UserInfo userInfo) async {
    final fileName = 'aifit_track_${DateTime.now().toIso8601String()}';
    // final file = await getCsv(list, fileName);
    final bytes = getCsvBytes(track, fileName, userInfo);
    Share.shareXFiles([XFile.fromData(bytes, mimeType: 'csv')]);
  }

  String _buildCsv(SensorTrack track, UserInfo userInfo) {
    final data = track.sensorsData
        ?.map((e) => e.toCsvList(track.activityType, track.smartphonePosition))
        .toList();
    final csv = const ListToCsvConverter().convert([
      [
        'Timestamp',
        'Acc_x',
        'Acc_y',
        'Acc_z',
        'Acc_timestamp',
        'Acc_gravity_x',
        'Acc_gravity_y',
        'Acc_gravity_z',
        'Acc_gravity_timestamp',
        'Gyro_x',
        'Gyro_y',
        'Gyro_z',
        'Gyro_timestamp',
        'Magn_x',
        'Magn_y',
        'Magn_z',
        'Magn_timestamp',
        'Activity_recognition',
        'User_activity_choice',
        'User_smartphone_position',
        'Age: ${userInfo.age}',
        'Gender: ${userInfo.gender?.name}',
        'Height: ${userInfo.height}',
        'Weight: ${userInfo.weight}',
      ],
      ...data ?? [],
    ]);
    return csv;
  }

  Uint8List getCsvBytes(
      SensorTrack track, String eventName, UserInfo userInfo,) {
    final csv = _buildCsv(track, userInfo);
    final bytes = Uint8List.fromList(utf8.encode(csv));
    return bytes;
  }

  Future<File?> getCsv(
    SensorTrack track,
    String filename,
    UserInfo userInfo,
  ) async {
    try {
      final csv = _buildCsv(track, userInfo);

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
          return getCsv(track, filename,userInfo);
        }
      }
      return null;
    } catch (ex) {
      logger.e(ex);
      return null;
    }
  }
}
