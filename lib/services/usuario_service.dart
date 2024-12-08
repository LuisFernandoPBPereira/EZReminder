import 'package:firebase_auth/firebase_auth.dart';

class UsuarioService {
  User? getUsuario() {
    return FirebaseAuth.instance.currentUser;
  }
}
