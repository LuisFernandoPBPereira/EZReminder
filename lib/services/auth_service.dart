import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String?> cadastrarUsuario(
      {required String nome,
      required String senha,
      required String email}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);
      await userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == "email-already-in-use") {
        return "Usuário já cadastrado";
      }

      return "Erro desconhecido";
    }
  }

  Future<String?> logarUsuario(
      {required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (exception) {
      return exception.message;
    }
  }

  Future<void> deslogarUsuario() async {
    return _firebaseAuth.signOut();
  }

  User? getUsuario() {
    return _firebaseAuth.currentUser;
  }
}
