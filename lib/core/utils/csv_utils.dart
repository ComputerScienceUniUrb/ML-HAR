import 'dart:convert';
import 'dart:io';

import 'package:aifit/constants.dart';
import 'package:aifit/core/clients/device_info.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:csv/csv.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class MyDeviceInfo {
  final String platform;
  final String model;
  final String sdkInt;
  final String manufacturer;
  final String release;
  final String deviceModel;
  final String os;

  MyDeviceInfo({
    required this.platform,
    required this.model,
    required this.sdkInt,
    required this.manufacturer,
    required this.release,
    required this.deviceModel,
    required this.os,
  });

  factory MyDeviceInfo.fromIOS(IosDeviceInfo info) {
    return MyDeviceInfo(
        platform: 'iOS',
        model: info.model,
        sdkInt: info.systemName,
        manufacturer: 'Apple',
        release: info.systemVersion,
        deviceModel: 'Apple ${info.utsname.machine}',
        os: 'iOS ${info.systemVersion}'
    );
  }

  factory MyDeviceInfo.fromAndroid(AndroidDeviceInfo info) {
    return MyDeviceInfo(
      platform: 'Android',
      model: info.model,
      sdkInt: info.version.sdkInt.toString(),
      manufacturer: info.manufacturer,
      release: info.version.release,
      deviceModel: '${info.manufacturer} ${info.model}',
      os: 'Android ${info.version.release} (SDK ${info.version.sdkInt})',
    );
  }
}

// TODO add data compatible for iOS [AndroidDeviceInfo]
Future<void> downloadCSV(SensorTrack track,
    MyDeviceInfo deviceInfo,) async {
  final fileName = 'aifit_track_${DateTime.now().toIso8601String()}';
  // final file = await getCsv(list, fileName);
  final bytes = getCsvBytes(track, fileName, deviceInfo);
  Share.shareXFiles([XFile.fromData(bytes, mimeType: 'csv')]);
}

String buildCsv(SensorTrack track, MyDeviceInfo deviceInfo) {
  final data = track.sensorsData
      ?.map(
        (e) => e.toCsvList(),
  )
      .toList();
  final release = deviceInfo.release;
  final sdkInt = deviceInfo.sdkInt;
  final manufacturer = deviceInfo.manufacturer;
  final model = deviceInfo.model;
  final csv = const ListToCsvConverter().convert([
    csvUserInfoHeader,
    [
      '${deviceInfo.platform} $release (SDK $sdkInt)',
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

Uint8List getCsvBytes(SensorTrack track,
    String eventName,
    MyDeviceInfo deviceInfo,) {
  final csv = buildCsv(track, deviceInfo);
  final bytes = Uint8List.fromList(utf8.encode(csv));
  return bytes;
}

Future<File?> getCsv(SensorTrack track,
    String filename,
    MyDeviceInfo deviceInfo,) async {
  try {
    final csv = buildCsv(track, deviceInfo);

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
        return getCsv(track, filename, deviceInfo);
      }
    }
    return null;
  } catch (ex) {
    logger.e(ex);
    return null;
  }
}
