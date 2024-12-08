import 'package:ez_reminder/components/app_layout.dart';
import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/custom_notification.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/login.dart';
import 'package:ez_reminder/services/auth_service.dart';
import 'package:ez_reminder/services/notification_service.dart';
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: CustomButton(
                label: "Exemplo de notificação",
                onPressed: () {
                  Provider.of<NotificationService>(context, listen: false)
                      .showNotificationExample(CustomNotification(
                          id: 1,
                          title: "Ir para a faculdade",
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
