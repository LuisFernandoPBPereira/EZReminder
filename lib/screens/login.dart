import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/home.dart';
import 'package:ez_reminder/screens/redefinicao_de_senha.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _senha = TextEditingController();

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
                "Faça o login com sua conta",
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
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RedefinicaoDeSenha()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 60.0),
                      child: Text(
                        "Esqueceu sua senha?",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: ElevatedButton(
                onPressed: () {
                  if (_email.text == "luis@exemplo.com" &&
                      _senha.text == "123") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(EzreminderColors.primaryVerde),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  fixedSize: const Size(245, 49),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                child: Text(
                  "Entrar",
                  style:
                      TextStyle(color: Color(EzreminderColors.backgroundPreto)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  print("Clicado");
                },
                child: const Text(
                  "Crie sua conta",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
