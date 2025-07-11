import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreReference {
  static CollectionReference get sessionsCollection =>
      FirebaseFirestore.instance.collection('sessions');

  static DocumentReference sessionDoc(String sessionId) {
    return sessionsCollection.doc(sessionId);
  }

  static CollectionReference sessionStepsCollection(String sessionId) =>
      sessionDoc(sessionId).collection('steps');

  static DocumentReference stepDoc(String sessionId, String stepId) {
    return sessionStepsCollection(sessionId).doc(stepId);
  }

  static CollectionReference sessionPlayersCollection(String sessionId) =>
      sessionDoc(sessionId).collection('players');

  static DocumentReference playerDoc(String sessionId, String playerId) {
    return sessionPlayersCollection(sessionId).doc(playerId);
  }
}
