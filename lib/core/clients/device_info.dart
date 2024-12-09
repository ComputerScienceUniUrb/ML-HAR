import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info.g.dart';

@riverpod
Future<AndroidDeviceInfo> getAndroidDeviceInfo(GetAndroidDeviceInfoRef ref) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  return await deviceInfo.androidInfo;
}

extension AndroidDeviceInfoX on AndroidDeviceInfo {
  String get deviceModel => '$manufacturer $model';

  String get os => 'Android ${version.release} (SDK ${version.sdkInt})';
}
