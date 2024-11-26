import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/features/home/screens/sensor_tracking/ui/track_details.dart';
import 'package:flutter/material.dart';

class TrackTile extends StatelessWidget {
  final SensorTrack sensorTrack;

  const TrackTile({required this.sensorTrack, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TrackDetailsScreen(sensorTrack: sensorTrack),
          ),
        );
      },
      trailing: sensorTrack.isUploaded
          ? const Icon(
              Icons.cloud_upload,
              color: Colors.green,
            )
          : null,
      leading: Text(sensorTrack.id.toString()),
      title: Text(
        '${sensorTrack.activityType?.name ?? ''} ${sensorTrack.smartphonePosition?.name ?? ''}, samples ${sensorTrack.sensorsData?.length ?? 0}',
      ),
      subtitle: Text(sensorTrack.timestamp?.toIso8601String() ?? '-'),
      // trailing: IconButton(
      //   icon: const Icon(Icons.download),
      //   color: Colors.black,
      //   onPressed: () async {
      //     final androidInfo =
      //         await ref.read(getAndroidDeviceInfoProvider.future);
      //     downloadCSV(state[i], androidInfo);
      //   },
      // ),
    );
  }
}
