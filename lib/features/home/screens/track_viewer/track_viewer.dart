import 'package:aifit/constants.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/utils/csv_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_table_view/material_table_view.dart';

class TrackViewerScreen extends ConsumerWidget with CSVMixin {
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
            onPressed: () {
              downloadCSV(track);
            },
          ),
        ],
      ),
      body: TableView.builder(
        headerBuilder: (context, contentBuilder) {
          return contentBuilder(context, (context, column) {
            return Text(
              csvHeader[column] ?? '-',
            );
          });
        },
        columns: [
          const TableColumn(
            width: 140.0,
            freezePriority: 100,
          ),
          for (var i = 1; i < 24; i++) const TableColumn(width: 140),
        ],
        rowCount: track.sensorsData?.length ?? 0,
        rowHeight: 56.0,
        rowBuilder: (context, row, contentBuilder) {
          // if (noDataYetFor(row)) {
          //   return null; // to use a placeholder
          // }

          return contentBuilder(
            context,
            (context, column) => Text(
              track.sensorsData?[row].valueFromColumnNumber(
                    column,
                    track.activityType,
                    track.smartphonePosition,
                    track.userInfo,
                  ) ??
                  '-',
            ), // build a cell widget
          );
        },
        // specify other parameters for other features
      ),
    );
  }
}
