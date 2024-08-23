import 'package:aifit/core/utils/logger.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';

Future<bool> isPermissionGrants() async {
  // Check if the user has granted permission. If not, request permission.
  PermissionRequestResult reqResult;
  reqResult = await FlutterActivityRecognition.instance.checkPermission();
  if (reqResult == PermissionRequestResult.PERMANENTLY_DENIED) {
    logger.d('Permission is permanently denied.');
    return false;
  } else if (reqResult == PermissionRequestResult.DENIED) {
    reqResult = await FlutterActivityRecognition.instance.requestPermission();
    if (reqResult != PermissionRequestResult.GRANTED) {
      logger.d('Permission is denied.');
      return false;
    }
  }

  return true;
}
