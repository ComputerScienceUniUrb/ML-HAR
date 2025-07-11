import 'package:aifit/app/database/database.dart';
import 'package:aifit/app/database/tables.dart';
import 'package:drift/drift.dart';

part 'wom_transactions_dao.g.dart';

@DriftAccessor(tables: [WomTransactions])
class WomTransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$WomTransactionsDaoMixin {
  // Il costruttore è richiesto da Drift
  WomTransactionsDao(AppDatabase db) : super(db);

  /// Osserva tutte le transazioni WOM nel database.
  /// Ritorna uno Stream che emette una nuova lista ogni volta che i dati cambiano.
  Stream<List<WomTransaction>> watchAllTransactions() =>
      select(womTransactions).watch();

  /// Recupera tutte le transazioni WOM una sola volta.
  Future<List<WomTransaction>> getAllTransactions() =>
      select(womTransactions).get();

  /// Calcola la somma totale dei WOM in tutti i reward.
  /// Ritorna 0 se non ci sono reward.
  Future<int> getTotalWomCount() async {
    // Definisce l'espressione per la somma della colonna womCount.
    final sumExpression = womTransactions.womCount.sum();
    // Crea una query che seleziona solo il risultato dell'espressione.
    final query = selectOnly(womTransactions)..addColumns([sumExpression]);
    // Esegue la query e legge il risultato.
    // Se la tabella è vuota, la somma è NULL, quindi gestiamo il caso con '?? 0'.
    final result = await query.map((row) => row.read(sumExpression)).getSingle();
    return result ?? 0;
  }

  /// Osserva la somma totale dei WOM in tutti i reward.
  /// Emette un nuovo valore ogni volta che i dati cambiano.
  /// Emette 0 se non ci sono reward.
  Stream<int> watchTotalWomCount() {
    final sumExpression = womTransactions.womCount.sum();
    final query = selectOnly(womTransactions)..addColumns([sumExpression]);
    // Usa watchSingle per osservare il risultato della query.
    // Mappa il risultato (che può essere nullo) a un intero, con 0 come default.
    return query
        .map((row) => row.read(sumExpression))
        .watchSingle()
        .map((sum) => sum ?? 0);
  }

  /// Inserisce una nuova transazione.
  Future<int> addTransaction(WomTransactionsCompanion transaction) =>
      into(womTransactions).insert(transaction);

  /// Elimina una transazione specifica.
  Future<int> deleteTransaction(WomTransaction transaction) =>
      delete(womTransactions).delete(transaction);

  /// Elimina tutte le transazioni.
  Future<int> deleteAllTransactions() => delete(womTransactions).go();
}