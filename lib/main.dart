import 'package:aifit/app/app.dart';
import 'package:aifit/core/navigation/go_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeGoRouter();
  runApp(const AIFitApp());
}
