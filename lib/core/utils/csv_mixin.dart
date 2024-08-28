import 'dart:convert';
import 'dart:io';

import 'package:aifit/core/data/sensors/models/sensor_track.dart';
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
    final bytes = getCsvBytes(track.sensorsData ?? [], fileName);
    Share.shareXFiles([XFile.fromData(bytes, mimeType: 'csv')]);
  }

  String _buildCsv(List<SensorsData> sensors) {
    final data = sensors.map((e) => e.toCsvList()).toList();
    final csv = const ListToCsvConverter().convert([
      [
        'Timestamp',
        'Acc_x',
        'Acc_y',
        'Acc_z',
        'Acc_timestamp',
        'Gyro_x',
        'Gyro_y',
        'Gyro_z',
        'Gyro_timestamp',
        'Magn_x',
        'Magn_y',
        'Magn_z',
        'Magn_timestamp',
        'Activity_recognition'
      ],
      ...data,
    ]);
    return csv;
  }

  Uint8List getCsvBytes(List<SensorsData> sensors, String eventName) {
    final csv = _buildCsv(sensors);
    final bytes = Uint8List.fromList(utf8.encode(csv));
    return bytes;
  }

  Future<File?> getCsv(List<SensorsData> sensors, String filename) async {
    try {
      final csv = _buildCsv(sensors);

      final statuses = await [
        Permission.storage,
      ].request();
      if (await Permission.storage.isGranted) {
        final dir =
            '${(await getExternalStorageDirectory())!.path}/$filename.csv';

        final f = File(dir);

        await f.writeAsString(csv);
        return f;
      }else{
        final status = await Permission.storage.request();
        if(status == PermissionStatus.granted){
          return getCsv(sensors, filename);
        }
      }
      return null;
    } catch (ex) {
      logger.e(ex);
      return null;
    }
  }
}
