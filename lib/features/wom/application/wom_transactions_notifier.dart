import 'package:aifit/app/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wom_transactions_notifier.g.dart';

@riverpod
Stream<List<WomTransaction>> getWomTransactions(Ref ref) async* {
  yield* ref
      .read(getAppDatabaseProvider)
      .womTransactionsDao
      .watchAllTransactions();
}
