import 'package:ez_reminder/components/app_layout.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/login.dart';
import 'package:ez_reminder/services/auth_service.dart';
import 'package:flutter/material.dart';

class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
        content: SafeArea(
            child: Center(
      child: Column(
        children: [
          const Titulo(texto: "Configurações"),
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
          )
        ],
      ),
    )));
  }
}
