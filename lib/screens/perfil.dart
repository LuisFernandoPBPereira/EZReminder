import 'package:ez_reminder/components/app_layout.dart';
import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  TextEditingController nomeUsuario = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        content: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Titulo(texto: "Perfil"),
              Icon(
                Icons.account_circle_outlined,
                color: Color(EzreminderColors.branco),
                size: 50,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
                  child: TextField(
                    controller: nomeUsuario,
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
                    controller: dataNascimento,
                    decoration: InputDecoration(
                      labelStyle:
                          TextStyle(color: Color(EzreminderColors.branco)),
                      labelText: "Data de Nascimento",
                      border: const UnderlineInputBorder(),
                    ),
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
              child: CustomButton(label: "Salvar", onPressed: () {}))
        ],
      ),
    )));
  }
}
