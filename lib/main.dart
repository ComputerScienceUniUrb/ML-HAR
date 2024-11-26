import 'package:aifit/app/app.dart';
import 'package:aifit/core/navigation/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeGoRouter();
  runApp(const AIFitApp());
}
