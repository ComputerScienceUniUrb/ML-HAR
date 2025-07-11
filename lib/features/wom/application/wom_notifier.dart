import 'package:aifit/app/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wom_notifier.g.dart';


@riverpod
Stream<List<WomReward>> getWomRewards(Ref ref) async* {
  yield* ref
      .watch(getAppDatabaseProvider)
      .womRewardsDao
      .watchAllRewards();
}

@riverpod
Stream<int> getTotalWomEarnedCount(Ref ref) async* {
  yield* ref.watch(getAppDatabaseProvider).womRewardsDao.watchTotalWomCount();
}

@riverpod
Stream<int> getTotalWomRedeemedCount(Ref ref) async* {
  yield* ref
      .watch(getAppDatabaseProvider)
      .womTransactionsDao
      .watchTotalWomCount();
}
