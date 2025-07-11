import 'package:aifit/app/database/database.dart';
import 'package:aifit/app/database/tables.dart';
import 'package:drift/drift.dart';

part 'sessions_dao.g.dart';

@DriftAccessor(tables: [Sessions])
class SessionsDao extends DatabaseAccessor<AppDatabase>
    with _$SessionsDaoMixin {

  SessionsDao(super.db);

  /// Osserva tutte le sessioni nel database, ordinate per data di aggiunta.
  /// Ritorna uno Stream che emette una nuova lista ogni volta che i dati cambiano.
  Stream<List<Session>> watchAllSessions() =>
      (select(sessions)..orderBy([(t) => OrderingTerm.desc(t.addedOn)]))
          .watch();

  /// Recupera una singola sessione tramite il suo ID.
  /// Ritorna `null` se nessuna sessione corrisponde all'ID.
  Future<Session?> getSessionById(String sessionId) =>
      (select(sessions)..where((tbl) => tbl.sessionId.equals(sessionId)))
          .getSingleOrNull();

  /// Inserisce una nuova sessione o la sostituisce se esiste già una
  /// sessione con la stessa chiave primaria.
  Future<void> upsertSession(SessionsCompanion session) =>
      into(sessions).insert(session, mode: InsertMode.insertOrReplace);

  /// Aggiorna una sessione esistente.
  Future<bool> updateSession(SessionsCompanion session) =>
      update(sessions).replace(session);

  /// Elimina una sessione specifica.
  Future<int> deleteSession(Session sessionData) =>
      delete(sessions).delete(sessionData);
}
