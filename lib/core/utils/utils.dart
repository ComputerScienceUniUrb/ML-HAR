import 'package:aifit/core/utils/logger.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';

Future<bool> isPermissionGrants() async {
  // Check if the user has granted permission. If not, request permission.
  ActivityPermission reqResult;
  reqResult = await FlutterActivityRecognition.instance.checkPermission();
  if (reqResult == ActivityPermission.PERMANENTLY_DENIED) {
    logger.d('Permission is permanently denied.');
    return false;
  } else if (reqResult == ActivityPermission.DENIED) {
    reqResult = await FlutterActivityRecognition.instance.requestPermission();
    if (reqResult != ActivityPermission.GRANTED) {
      logger.d('Permission is denied.');
      return false;
    }
  }

  return true;
}
