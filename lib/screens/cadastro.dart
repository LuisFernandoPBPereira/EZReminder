import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/custom_snackbar.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
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
      body: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
              child: Image.asset("Logo.png"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
              child: const Text(
                "Crie sua conta",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF)),
                textAlign: TextAlign.center,
              ),
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
    );
  }

  void cadastrarUsuario() {
    authService
        .cadastrarUsuario(
            nome: _nome.text, senha: _senha.text, email: _email.text)
        .then((String? erro) {
      if (erro != null) {
        mostrarSnackBar(context: context, texto: erro);
      } else {
        mostrarSnackBar(
            context: context,
            texto: "Cadastro efetuado com sucesso",
            isErro: false);
      }
    });
  }
}
