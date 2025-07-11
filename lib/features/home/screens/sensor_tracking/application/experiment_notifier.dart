import 'package:aifit/core/data/experiment/models/experiment.dart';
import 'package:aifit/core/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experiment_notifier.g.dart';

@riverpod
Future<Experiment?> getExperimentByCode(Ref ref, String shortCode) async {
  try {
    final f = await FirebaseFirestore.instance
        .collection('experiments')
        .where('shortCode', isEqualTo: shortCode.toLowerCase())
        .limit(1)
        .get();
    if (f.docs.isEmpty) {
      return null;
    }
    return Experiment.fromJson(f.docs.first.data());
  } catch (ex, st) {
    logger.e('getExperimentByCode', error: ex, stackTrace: st);
    rethrow;
  }
}

@riverpod
Future<Experiment?> getExperimentById(Ref ref, String experimentId) async {
  try {
    final f = await FirebaseFirestore.instance
        .collection('experiments')
        .doc(experimentId)
        .get();
    final data = f.data();
    if (!f.exists || data == null) {
      return null;
    }
    return Experiment.fromJson(data);
  } catch (ex, st) {
    logger.e('getExperimentById', error: ex, stackTrace: st);
    rethrow;
  }
}
