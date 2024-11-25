import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/login.dart';
import 'package:flutter/material.dart';

class NovaSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(EzreminderColors.backgroundPreto),
      body: Container(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: Image.asset("Logo.png")),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text(
                "Redefinição de Senha",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text(
                "Digite a nova senha",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 60),
              child: const TextField(
                style: TextStyle(color: Color(0xFFFFFFFF)),
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFFFFFFFF)),
                    label: Text(
                      "Nova Senha",
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: const Text(
                "Confirme a nova senha",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 125),
              child: const TextField(
                style: TextStyle(color: Color(0xFFFFFFFF)),
                decoration: InputDecoration(
                    label: Text(
                  "Confirmar Senha",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
                )),
              ),
            ),
            SizedBox(
              width: 245,
              height: 49,
              child: CustomButton(
                  label: "Salvar Senha",
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()))
                      }),
            )
          ],
        ),
      ),
    );
  }
}
