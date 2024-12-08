import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/custom_snackbar.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/home.dart';
import 'package:ez_reminder/services/auth_service.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _email = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _senha = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(EzreminderColors.backgroundPreto),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
                child: Image.asset("assets/Logo.png"),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                "Sua senha deve conter pelo menos:\n",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF)),
                textAlign: TextAlign.left,
              ),
              const Text(
                "- 8 caracteres\n- 1 letra maiúscula\n- 1 letra minúscula\n- 1 número",
                style: TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
                textAlign: TextAlign.left,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
                  child: TextField(
                    controller: _nome,
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Color(EzreminderColors.branco)),
                      labelText: "Nome",
                      border: const UnderlineInputBorder(),
                    ),
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Color(EzreminderColors.branco)),
                      labelText: "Email",
                      border: const UnderlineInputBorder(),
                    ),
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 0),
                        child: TextField(
                          controller: _senha,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color(EzreminderColors.branco)),
                              labelText: "Senha",
                              border: const UnderlineInputBorder()),
                          style: const TextStyle(color: Color(0xFFFFFFFF)),
                          obscureText: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: CustomButton(
                      label: "Cadastrar", onPressed: () => cadastrarUsuario())),
            ],
          ),
        ),
      ),
    );
  }

  void cadastrarUsuario() {
    if (!contaValida()) return;

    authService
        .cadastrarUsuario(
            nome: _nome.text, senha: _senha.text, email: _email.text)
        .then((String? erro) {
      if (erro != null) {
        mostrarSnackBar(context: context, texto: erro);
      } else {
        if (mounted) {
          mostrarSnackBar(
              context: context,
              texto: "Cadastro efetuado com sucesso",
              isErro: false);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        }
      }
    });
  }

  bool contaValida() {
    var senhaValida = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$');
    var emailValido =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (_nome.text.isEmpty) {
      mostrarSnackBar(context: context, texto: "Insira um nome");
      return false;
    }
    if (!emailValido.hasMatch(_email.text)) {
      mostrarSnackBar(context: context, texto: "Email inválido");
      return false;
    }
    if (!senhaValida.hasMatch(_senha.text)) {
      mostrarSnackBar(
          context: context, texto: "Senha inválida: verifique os requisitos.");
      return false;
    }

    return true;
  }
}
