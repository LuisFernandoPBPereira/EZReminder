import 'package:flutter/material.dart';

class LembreteModel {
  String id;
  String nome;
  String descricao;
  String? localizacao;
  String tipoLembrete;
  int cor;
  String hora;
  String data;

  LembreteModel(
      {required this.id,
      required this.nome,
      localizacao,
      required this.descricao,
      required this.tipoLembrete,
      required this.cor,
      required this.hora,
      required this.data});

  LembreteModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        localizacao = map["localizacao"],
        descricao = map["descricao"],
        tipoLembrete = map["tipoLembrete"],
        cor = map["cor"],
        hora = map["hora"],
        data = map["data"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "localizacao": localizacao,
      "descricao": descricao,
      "tipoLembrete": tipoLembrete,
      "cor": cor,
      "hora": hora,
      "data": data
    };
  }
}
