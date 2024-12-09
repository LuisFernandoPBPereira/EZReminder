import 'package:EZReminder/components/app_layout.dart';
import 'package:EZReminder/components/custom_button.dart';
import 'package:EZReminder/components/custom_notification.dart';
import 'package:EZReminder/components/titulo.dart';
import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/global/plano_config.dart';
import 'package:EZReminder/main.dart';
import 'package:EZReminder/screens/login.dart';
import 'package:EZReminder/services/auth_service.dart';
import 'package:EZReminder/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        content: SafeArea(
            child: Center(
      child: Column(
        children: [
          const Titulo(texto: "Configurações"),
          PlanoConfig.planoConfig == Plano.gratuito
              ? Text("Seu plano: Gratuito",
                  style: TextStyle(
                      color: Color(EzreminderColors.branco), fontSize: 20))
              : Text("Seu plano: Premium",
                  style: TextStyle(
                      color: Color(EzreminderColors.branco), fontSize: 20)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: CustomButton(
                label: "Exemplo de notificação",
                onPressed: () {
                  PlanoConfig.planoConfig == Plano.gratuito
                      ? Provider.of<NotificationService>(context, listen: false)
                          .showNotificationExample(CustomNotification(
                              id: 1,
                              title: "Ir para a faculdade",
                              body: "Não posso pegar DP",
                              date: DateTime.now()))
                      : Provider.of<NotificationService>(context, listen: false)
                          .showNotificationExample(CustomNotification(
                              id: 1,
                              title: "Ir para a faculdade - UNASP",
                              body: "Não posso pegar DP",
                              date: DateTime.now()));
                }),
          ),
          ElevatedButton(
            onPressed: () {
              AuthService().deslogarUsuario();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(EzreminderColors.backgroundPreto),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              elevation: 20,
              fixedSize: const Size(245, 49),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            child: const Text(
              "Sair da conta",
              style: TextStyle(color: Color(0xFFFF0000)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    )));
  }
}
