class EstatisticaModel {
  final String id;
  int lembretesConcluidos;

  EstatisticaModel({required this.id, required this.lembretesConcluidos});

  EstatisticaModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        lembretesConcluidos = map["lembretesConcluidos"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "lembretesConcluidos": lembretesConcluidos,
    };
  }
}
