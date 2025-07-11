
import 'package:aifit/app/database/database.dart';
import 'package:aifit/app/database/tables.dart';
import 'package:drift/drift.dart';

part 'wom_rewards_dao.g.dart';

@DriftAccessor(tables: [WomRewards])
class WomRewardsDao extends DatabaseAccessor<AppDatabase>
    with _$WomRewardsDaoMixin {
  WomRewardsDao(super.db);

  /// Osserva tutti i WOM reward nel database, ordinati per data di aggiunta.
  /// Ritorna uno Stream che emette una nuova lista ogni volta che i dati cambiano.
  Stream<List<WomReward>> watchAllRewards() =>
      (select(womRewards)..orderBy([(t) => OrderingTerm.desc(t.addedOn)]))
          .watch();

  /// Recupera tutti i WOM reward una sola volta.
  Future<List<WomReward>> getAllRewards() =>
      (select(womRewards)..orderBy([(t) => OrderingTerm.desc(t.addedOn)]))
          .get();

  /// Calcola la somma totale dei WOM in tutti i reward.
  /// Ritorna 0 se non ci sono reward.
  Future<int> getTotalWomCount() async {
    // Definisce l'espressione per la somma della colonna womCount.
    final sumExpression = womRewards.womCount.sum();
    // Crea una query che seleziona solo il risultato dell'espressione.
    final query = selectOnly(womRewards)..addColumns([sumExpression]);
    // Esegue la query e legge il risultato.
    // Se la tabella è vuota, la somma è NULL, quindi gestiamo il caso con '?? 0'.
    final result = await query.map((row) => row.read(sumExpression)).getSingle();
    return result ?? 0;
  }

  /// Osserva la somma totale dei WOM in tutti i reward.
  /// Emette un nuovo valore ogni volta che i dati cambiano.
  /// Emette 0 se non ci sono reward.
  Stream<int> watchTotalWomCount() {
    final sumExpression = womRewards.womCount.sum();
    final query = selectOnly(womRewards)..addColumns([sumExpression]);
    // Usa watchSingle per osservare il risultato della query.
    // Mappa il risultato (che può essere nullo) a un intero, con 0 come default.
    return query
        .map((row) => row.read(sumExpression))
        .watchSingle()
        .map((sum) => sum ?? 0);
  }

  /// Inserisce un nuovo reward.
  Future<int> addReward(WomRewardsCompanion reward) =>
      into(womRewards).insert(reward);

  /// Elimina uno specifico reward.
  Future<int> deleteReward(WomReward reward) =>
      delete(womRewards).delete(reward);

  /// Elimina tutti i reward dalla tabella.
  Future<int> deleteAllRewards() => delete(womRewards).go();
}