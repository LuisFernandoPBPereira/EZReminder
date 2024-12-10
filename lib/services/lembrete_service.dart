import 'package:EZReminder/models/estatistica_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:EZReminder/models/lembrete_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

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

  Future<void> removerLembrete({required String idLembrete}) {
    atualizarEstatistica();

    return firebaseFirestore.collection(userId).doc(idLembrete).delete();
  }

  Future<void> adicionarEstatistica() async {
    var estatistica =
        EstatisticaModel(id: const Uuid().v1(), lembretesConcluidos: 0);

    await firebaseFirestore
        .collection("estatistica-$userId")
        .doc(estatistica.id)
        .set(estatistica.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getEstatistica() async {
    return await firebaseFirestore.collection("estatistica-$userId").get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEstatisticaToWidget() {
    return firebaseFirestore.collection("estatistica-$userId").snapshots();
  }

  Future<void> atualizarEstatistica() async {
    var estatistica = await getEstatistica();
    List<EstatisticaModel> estatisticas = estatistica.docs
        .map((doc) => EstatisticaModel.fromMap(doc.data()))
        .toList();

    var estatisticaUser = estatisticas.first;

    estatisticaUser.lembretesConcluidos += 1;

    await firebaseFirestore
        .collection("estatistica-$userId")
        .doc(estatisticaUser.id)
        .set(estatisticaUser.toMap());
  }

  Future<List<LembreteModel>> getListLembretes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection(userId).get();

      List<LembreteModel> data = querySnapshot.docs
          .map((doc) => LembreteModel.fromMap(doc.data()))
          .toList();

      return data;
    } catch (e) {
      print("Erro ao recuperar os dados: $e");
      return [];
    }
  }
}
