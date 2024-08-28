import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:flutter/material.dart';

class RecordTile extends StatelessWidget {
  final ARData record;

  const RecordTile({required this.record, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(record.activity.toString()),
      subtitle: Text(record.timestamp?.toIso8601String() ?? '-'),
      trailing: Text(record.confidence.toString()),
    );
  }
}
