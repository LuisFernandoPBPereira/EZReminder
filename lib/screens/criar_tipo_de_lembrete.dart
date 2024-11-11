import 'package:ez_reminder/components/app_layout.dart';
import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class CriarTipoDeLembrete extends StatelessWidget {
  TextEditingController nomeTipoLembrete = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        content: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Titulo(texto: "Criar Tipo de Lembrete"),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
              child: TextField(
                controller: nomeTipoLembrete,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(EzreminderColors.branco)),
                  labelText: "Nome do Tipo de Lembrete",
                  border: const UnderlineInputBorder(),
                ),
                style: const TextStyle(color: Color(0xFFFFFFFF)),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
              child: CustomButton(label: "Criar", onPressed: () {}))
        ],
      ),
    ));
  }
}
