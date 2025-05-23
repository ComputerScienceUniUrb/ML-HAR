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
        .where('shortCode', isEqualTo: shortCode)
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
