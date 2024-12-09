import 'package:EZReminder/models/usuario_model.dart';

class UsuarioRepository {
  List<UsuarioModel> getUsuarios() {
    return [
      UsuarioModel(1, "email@email.com", "senha tal", DateTime(2000, 1, 1)),
    ];
  }

  UsuarioModel getUsuarioById(int id) {
    var usuarios = getUsuarios();
    var usuario = usuarios.firstWhere((x) => x.id == id);

    return usuario;
  }
}
