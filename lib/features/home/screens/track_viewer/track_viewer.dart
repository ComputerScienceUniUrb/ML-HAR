import 'package:aifit/constants.dart';
import 'package:aifit/core/clients/device_info.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/utils/csv_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_table_view/material_table_view.dart';

class TrackViewerScreen extends ConsumerWidget {
  final SensorTrack track;

  const TrackViewerScreen({
    required this.track,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            color: Colors.black,
            onPressed: () async {
              final deviceInfo = await ref.read(getDeviceInfoProvider.future);
              downloadCSV(track, deviceInfo);
            },
          ),
        ],
      ),
      body: TableView.builder(
        headerBuilder: (context, contentBuilder) {
          return contentBuilder(context, (context, column) {
            return Text(
              csvSensorsHeader[column] ?? '-',
            );
          });
        },
        columns: [
          const TableColumn(
            width: 140.0,
            freezePriority: 100,
          ),
          for (var i = 1; i < 18; i++) const TableColumn(width: 140),
        ],
        rowCount: track.sensorsData?.length ?? 0,
        rowHeight: 56.0,
        rowBuilder: (context, row, contentBuilder) {
          return contentBuilder(
            context,
            (context, column) => Text(
              track.sensorsData?[row].valueFromColumnNumber(column) ?? '-',
            ), // build a cell widget
          );
        },
      ),
    );
  }
}
