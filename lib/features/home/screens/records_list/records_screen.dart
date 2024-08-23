import 'package:aifit/core/data/activity_recognition/models/ar_data.dart';
import 'package:aifit/core/utils/date_extension.dart';
import 'package:aifit/features/home/core/navigation/records_route.dart';
import 'package:aifit/features/home/screens/widgets/record_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordsScreen extends ConsumerWidget {
  final RecordsArgumentsRoute arguments;

  const RecordsScreen({
    super.key,
    required this.arguments,
  });

  DateTime get dateTime => arguments.dateTime;

  List<ARData> get records => arguments.records;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dateTime.isToday ? 'Oggi' : dateTime.toIso8601String()),
      ),
      body: ListView(
        children: [
          for (final r in records) RecordTile(record: r),
        ],
      ),
    );
  }
}
