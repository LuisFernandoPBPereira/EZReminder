import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/email_redefinicao_de_senha.dart';
import 'package:flutter/material.dart';

class RedefinicaoDeSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(EzreminderColors.backgroundPreto),
      body: Container(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset("Logo.png")),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
              child: Text("Redefinir Senha",
                  style: TextStyle(
                      color: Color(EzreminderColors.branco),
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("Digite seu e-mail",
                  style: TextStyle(
                      color: Color(EzreminderColors.branco), fontSize: 20)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
              child: const TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email_outlined),
                    suffixIconColor: Color(0xFFFFFFFF),
                    label: Text("Email"),
                    labelStyle: TextStyle(color: Color(0xFFFFFFFF))),
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 40),
                child: CustomButton(
                    label: "Enviar Código",
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailRedefinicaoDeSenha()))
                        })),
          ],
        ),
      ),
    );
  }
}
