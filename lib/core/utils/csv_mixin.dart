import 'dart:convert';
import 'dart:io';

import 'package:aifit/constants.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/user/models/user_info.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:csv/csv.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

mixin CSVMixin {
  // TODO add data compatible for iOS [AndroidDeviceInfo]
  Future<void> downloadCSV(
    SensorTrack track,
    AndroidDeviceInfo androidDeviceInfo,
  ) async {
    final fileName = 'aifit_track_${DateTime.now().toIso8601String()}';
    // final file = await getCsv(list, fileName);
    final bytes = getCsvBytes(track, fileName, androidDeviceInfo);
    Share.shareXFiles([XFile.fromData(bytes, mimeType: 'csv')]);
  }

  String _buildCsv(SensorTrack track, AndroidDeviceInfo androidDeviceInfo) {
    final data = track.sensorsData
        ?.map(
          (e) => e.toCsvList(),
        )
        .toList();
    final release = androidDeviceInfo.version.release;
    final sdkInt = androidDeviceInfo.version.sdkInt;
    final manufacturer = androidDeviceInfo.manufacturer;
    final model = androidDeviceInfo.model;
    final csv = const ListToCsvConverter().convert([
      csvUserInfoHeader,
      [
        'Android $release (SDK $sdkInt)',
        '$manufacturer $model',
        track.startBatteryLevel,
        track.isInBatterySaveMode,
        track.activityType?.name,
        track.smartphonePosition?.name,
        track.userInfo?.age,
        track.userInfo?.gender?.name,
        track.userInfo?.height,
        track.userInfo?.weight,
      ],
      csvSensorsHeader,
      ...data ?? [],
    ]);
    return csv;
  }

  Uint8List getCsvBytes(
    SensorTrack track,
    String eventName,
    AndroidDeviceInfo androidDeviceInfo,
  ) {
    final csv = _buildCsv(track, androidDeviceInfo);
    final bytes = Uint8List.fromList(utf8.encode(csv));
    return bytes;
  }

  Future<File?> getCsv(
    SensorTrack track,
    String filename,
    AndroidDeviceInfo androidDeviceInfo,
  ) async {
    try {
      final csv = _buildCsv(track, androidDeviceInfo);

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
          return getCsv(track, filename, androidDeviceInfo);
        }
      }
      return null;
    } catch (ex) {
      logger.e(ex);
      return null;
    }
  }
}
