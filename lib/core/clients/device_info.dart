import 'dart:io';

import 'package:aifit/core/utils/csv_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info.g.dart';

// @riverpod
// Future<AndroidDeviceInfo> getAndroidDeviceInfo(
//   GetAndroidDeviceInfoRef ref,
// ) async {
//   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//   return await deviceInfo.androidInfo;
// }

extension AndroidDeviceInfoX on AndroidDeviceInfo {
  String get deviceModel => '$manufacturer $model';

  String get os => 'Android ${version.release} (SDK ${version.sdkInt})';
}

@riverpod
Future<MyDeviceInfo> getDeviceInfo(GetDeviceInfoRef ref) async {
  DeviceInfoPlugin plugin = DeviceInfoPlugin();

  return await getMyDeviceInfo(plugin);
}

Future<MyDeviceInfo> getMyDeviceInfo(DeviceInfoPlugin plugin) async {
  late MyDeviceInfo deviceInfo;
  if (Platform.isIOS) {
    final ios = await plugin.iosInfo;
    deviceInfo = MyDeviceInfo.fromIOS(ios);
  } else {
    final android = await plugin.androidInfo;
    deviceInfo = MyDeviceInfo.fromAndroid(android);
  }
  return deviceInfo;
}
