import 'package:flutter/material.dart';

class LembreteModel {
  int id;
  int usuarioId;
  String nome;
  String descricao;
  String? localizacao;
  int tipoLembreteId;
  int cor;
  TimeOfDay hora;
  DateTime data;

  LembreteModel(
      {required this.id,
      required this.usuarioId,
      required this.nome,
      localizacao,
      required this.descricao,
      required this.tipoLembreteId,
      required this.cor,
      required this.hora,
      required this.data});
}
