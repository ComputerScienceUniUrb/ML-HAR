import 'package:aifit/app/app.dart';
import 'package:aifit/core/navigation/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeGoRouter();

  // If in debug mode, start the app without Sentry
  if (kDebugMode) {
    // Override the default error handling to prevent silent errors
    // from being displayed in the console.
    //
    // In debug mode, we mimic the behavior of not reporting silent errors
    // to Sentry by customizing the error handling process.
    FlutterError.onError = (details) {
      if (details.silent) return;
      FlutterError.presentError(details);
    };

    return startApp();
  }

  Logger.addLogListener((event) {
    if (event.level == Level.error) {
      Sentry.captureException(
        event.error,
        stackTrace: event.stackTrace,
      );
    }
  });
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://cc3a237e6d29a14d17b37e433cf70785@o4509545347874816.ingest.de.sentry.io/4509545398468688';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => startApp(),
  );
}

Future startApp() async {
  // const storage = FlutterSecureStorage();
  // var uid = await storage.read(key: 'userId');
  // if (uid == null) {
  //   uid = const Uuid().v4();
  //   await storage.write(key: 'userId', value: uid);
  // }
  runApp(const AIFitApp());
}
