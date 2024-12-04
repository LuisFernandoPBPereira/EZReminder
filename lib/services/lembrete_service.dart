import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_reminder/models/lembrete_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LembreteService {
  String userId;
  LembreteService() : userId = FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> adicionarLembrete(LembreteModel lembreteModel) async {
    await firebaseFirestore
        .collection(userId)
        .doc(lembreteModel.id)
        .set(lembreteModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getLembretes() {
    return firebaseFirestore.collection(userId).snapshots();
  }
}
