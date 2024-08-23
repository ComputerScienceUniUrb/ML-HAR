import 'package:flutter/material.dart';
import 'package:flutter_activity_recognition/flutter_activity_recognition.dart';

extension ActivityConfidenceX on ActivityConfidence {
  Color get color {
    return switch (this) {
      ActivityConfidence.HIGH => Colors.greenAccent,
      ActivityConfidence.MEDIUM => Colors.orangeAccent,
      ActivityConfidence.LOW => Colors.redAccent,
    };
  }
}