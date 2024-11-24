import 'package:ez_reminder/components/card_lembrete.dart';
import 'package:ez_reminder/models/lembrete_model.dart';
import 'package:flutter/material.dart';

class LembreteRepository {
  List<LembreteModel> getLembretes() {
    return [
      LembreteModel(
          id: 1,
          usuarioId: 1,
          nome: "nome",
          descricao: "descricao",
          tipoLembreteId: 1,
          cor: 0xFFADE566,
          hora: TimeOfDay.now(),
          data: DateTime.now()),
      LembreteModel(
          id: 2,
          usuarioId: 2,
          nome: "nome tal",
          descricao: "descricao tal",
          tipoLembreteId: 1,
          cor: 0xFFFFFF66,
          hora: TimeOfDay.now(),
          data: DateTime.now())
    ];
  }

  LembreteModel getLembreteById(int id) {
    var lembretes = getLembretes();
    var lembrete = lembretes.firstWhere((x) => x.id == id);

    return lembrete;
  }
}
