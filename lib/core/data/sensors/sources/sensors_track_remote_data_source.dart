import 'dart:convert';
import 'package:aifit/core/data/sensors/models/sensor_track.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensors_track_remote_data_source.g.dart';

@riverpod
SensorsTrackRemoteDataSource getSensorsRemoteDataSource(
    GetSensorsRemoteDataSourceRef ref) {
  return SensorsTrackRemoteDataSource();
}

class SensorsTrackRemoteDataSource {
  Future<String> uploadCsv(String docId, String csv) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final docRef = storageRef.child('csv/$docId.csv');
      await docRef.putData(utf8.encode(csv));
      return docRef.getDownloadURL();
    } on firebase_core.FirebaseException catch (e, st) {
      logger.e('uploadCsv', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<void> saveTrackOnFirestore(
      SensorTrack track, String downloadUrl) async {
    if (track.cloudId == null) {
      throw Exception('cloudId cannot be null');
    }
    try {
      final docRef =
          FirebaseFirestore.instance.collection('tracks').doc(track.cloudId);
      await docRef.set({
        ...track.toJson(),
        'downloadUrl': downloadUrl,
      });
    } catch (ex, st) {
      rethrow;
    }
  }
}
