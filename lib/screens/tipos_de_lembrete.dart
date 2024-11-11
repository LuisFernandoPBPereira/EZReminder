import 'package:ez_reminder/components/app_layout.dart';
import 'package:ez_reminder/components/card_tipo_de_lembrete.dart';
import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:flutter/material.dart';

class TiposDeLembrete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      content: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Titulo(texto: "Tipos de Lembrete"),
              CustomButton(
                  label: "Adicionar Tipo de Lembrete", onPressed: () => {}),
              const CardTipoDeLembrete(titulo: "Tipo de Lembrete 1")
            ],
          ),
        ),
      ),
    );
  }
}
