import 'package:aifit/app/database/database.dart';
import 'package:aifit/features/wom/data/wom_response.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wom_local_data_source.g.dart';

@riverpod
WomLocalDataSource getWomLocalDataSource(Ref ref) {
  return WomLocalDataSource(appDatabase: ref.watch(getAppDatabaseProvider));
}

class WomLocalDataSource {
  final AppDatabase appDatabase;

  WomLocalDataSource({required this.appDatabase});

  Future<void> saveWomTransaction(WomResponse response) async {
    await appDatabase.womTransactionsDao.addTransaction(
      WomTransactionsCompanion(
        womCount: Value(response.count),
        womLink: Value(response.link),
        womPin: Value(response.password),
        otc: Value(response.otc),
        addedOn: Value(DateTime.now()),
      ),
    );
  }
}
