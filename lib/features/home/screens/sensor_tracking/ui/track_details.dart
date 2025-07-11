import 'dart:io';

import 'package:aifit/core/clients/device_info.dart';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/data/sensors/repository/sensors_repository_impl.dart';
import 'package:aifit/core/utils/csv_utils.dart';
import 'package:aifit/features/home/screens/track_viewer/track_viewer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrackDetailsScreen extends HookConsumerWidget {
  final SensorTrack sensorTrack;

  const TrackDetailsScreen({
    required this.sensorTrack,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUploading = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Track details #${sensorTrack.id}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.table_view_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TrackViewerScreen(track: sensorTrack),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TrackInfo(
            label: 'Date',
            text: sensorTrack.timestamp?.toString(),
          ),
          _TrackInfo(
            label: 'Age',
            text: sensorTrack.userInfo?.age?.toString(),
          ),
          _TrackInfo(
            label: 'Height',
            text: sensorTrack.userInfo?.height?.toString(),
          ),
          _TrackInfo(
            label: 'Weight',
            text: sensorTrack.userInfo?.weight?.toString(),
          ),
          _TrackInfo(
            label: 'Gender',
            text: sensorTrack.userInfo?.gender?.translate,
          ),
          _TrackInfo(
            label: 'Smartphone position',
            text: sensorTrack.smartphonePosition?.translate,
          ),
          _TrackInfo(
            label: 'Activity Type',
            text: sensorTrack.activityType?.translate,
          ),
          _TrackInfo(
            label: 'Is in battery save mode?',
            text: sensorTrack.isInBatterySaveMode?.toString(),
          ),
          _TrackInfo(
            label: 'Start battery',
            text: '${sensorTrack.startBatteryLevel?.toString()}%',
          ),
          _TrackInfo(
            label: 'Samples count',
            text: sensorTrack.sensorsData?.length.toString(),
          ),
          _TrackInfo(
            label: 'Test duration',
            text: '${sensorTrack.testDuration?.toString() ?? '-'} sec',
          ),
          _TrackInfo(
            label: 'In cloud',
            text: sensorTrack.isUploaded?.toString() ?? 'false',
          ),
          ElevatedButton(
            onPressed: () => downloadCsvLocally(ref),
            child: const Text('Scarica CSV'),
          ),
          ElevatedButton(
            onPressed: sensorTrack.isUploaded || isUploading.value
                ? null
                : () async {
                    if (!isUploading.value) {
                      isUploading.value = true;
                      try {
                        await ref
                            .read(getSensorsRepositoryProvider)
                            .uploadTrack(sensorTrack);
                        isUploading.value = false;
                      } catch (ex, st) {
                        isUploading.value = false;
                        if (context.mounted) {
                          final dialog = AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.scale,
                            title: 'Errore nel caricamento della traccia',
                            btnOkOnPress: () {},
                          );
                          dialog.show();
                        }
                      }
                    }
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isUploading.value)
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                const Text('Upload CSV'),
              ],
            ),
          ),
          const SizedBox(height: 150),
        ],
      ),
    );
  }

  Future<void> downloadCsvLocally(WidgetRef ref) async {
    final deviceInfo = await ref.read(getDeviceInfoProvider.future);
    downloadCSV(sensorTrack, deviceInfo);
  }
}

class _TrackInfo extends StatelessWidget {
  final String label;
  final String? text;

  const _TrackInfo({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            text ?? '-',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
