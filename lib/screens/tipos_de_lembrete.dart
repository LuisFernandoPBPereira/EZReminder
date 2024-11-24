import 'package:ez_reminder/components/app_layout.dart';
import 'package:ez_reminder/components/card_tipo_de_lembrete.dart';
import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/repository/tipo_lembrete_repository.dart';
import 'package:flutter/material.dart';

class TiposDeLembrete extends StatefulWidget {
  const TiposDeLembrete({super.key});

  @override
  State<TiposDeLembrete> createState() => _TiposDeLembreteState();
}

class _TiposDeLembreteState extends State<TiposDeLembrete> {
  var tiposLembretes = TipoLembreteRepository().getTiposLembretes();

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
              Column(
                children: tiposLembretes.map((tipoLembrete) {
                  return CardTipoDeLembrete(titulo: tipoLembrete.nome);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
