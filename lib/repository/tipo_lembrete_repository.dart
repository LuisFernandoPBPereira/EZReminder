import 'package:ez_reminder/models/tipo_lembrete_model.dart';

class TipoLembreteRepository {
  List<TipoLembreteModel> getTiposLembretes() {
    return [
      TipoLembreteModel(1, "Academia"),
      TipoLembreteModel(2, "Trabalho"),
      TipoLembreteModel(3, "Faculdade"),
    ];
  }

  TipoLembreteModel getTipoLembreteById(int id) {
    var tiposLembretes = getTiposLembretes();

    var tipoLembrete = tiposLembretes.firstWhere((x) => x.id == id);

    return tipoLembrete;
  }
}
