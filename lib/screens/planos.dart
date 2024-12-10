import 'package:EZReminder/components/app_layout.dart';
import 'package:EZReminder/components/custom_button.dart';
import 'package:EZReminder/components/custom_snackbar.dart';
import 'package:EZReminder/components/titulo.dart';
import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/global/plano_config.dart';
import 'package:flutter/material.dart';

class Planos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        content: SingleChildScrollView(
      child: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Titulo(texto: "Planos"),
            Text(
              "Gratuito",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 25, 40, 25),
              child: SizedBox(
                width: 300,
                height: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(EzreminderColors.backgroundPreto),
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                    onPressed: () => alterarPlanoParaGratuito(context),
                    child: SizedBox(
                      width: 300,
                      height: 120,
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Criar lembretes",
                                  style: TextStyle(
                                    color: Color(EzreminderColors.branco),
                                  )),
                              Text("Personalizar cor do lembrete",
                                  style: TextStyle(
                                    color: Color(EzreminderColors.branco),
                                  )),
                              Text("Definir data e hora",
                                  style: TextStyle(
                                    color: Color(EzreminderColors.branco),
                                  )),
                            ]),
                      ),
                    )),
              ),
            ),
            Text(
              "EZReminder Premium",
              style: TextStyle(
                  color: Color(EzreminderColors.branco),
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "0,99/mês ou 9,99/ano",
              style: TextStyle(
                  color: Color(EzreminderColors.branco), fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 25, 40, 25),
              child: SizedBox(
                width: 300,
                height: 180,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(EzreminderColors.backgroundPreto),
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                    onPressed: () => {},
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Criar lembretes",
                              style: TextStyle(
                                color: Color(EzreminderColors.branco),
                              )),
                          Text("Personalizar cor do lembrete",
                              style: TextStyle(
                                color: Color(EzreminderColors.branco),
                              )),
                          Text("Definir data e hora",
                              style: TextStyle(
                                color: Color(EzreminderColors.branco),
                              )),
                          Text("Lembretes por Localização",
                              style: TextStyle(
                                color: Color(EzreminderColors.branco),
                              )),
                          Text("Estatísticas de Lembretes",
                              style: TextStyle(
                                color: Color(EzreminderColors.branco),
                              )),
                          Text("Notificações Inteligentes",
                              style: TextStyle(
                                color: Color(EzreminderColors.branco),
                              )),
                        ])),
              ),
            ),
            CustomButton(
                label: "Obter plano mensal",
                onPressed: () => assinarPlanoPremium(context)),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: CustomButton(
                    label: "Obter plano anual",
                    onPressed: () => assinarPlanoPremium(context))),
          ],
        ),
      )),
    ));
  }

  void assinarPlanoPremium(BuildContext context) {
    PlanoConfig.planoConfig = Plano.premium;

    mostrarSnackBar(
        context: context,
        texto: "Plano Premium assinado com sucesso!",
        isErro: false);
  }

  void alterarPlanoParaGratuito(BuildContext context) {
    PlanoConfig.planoConfig = Plano.gratuito;

    mostrarSnackBar(
        context: context,
        texto: "Agora você está no plano gratuito.",
        isErro: false);
  }
}
