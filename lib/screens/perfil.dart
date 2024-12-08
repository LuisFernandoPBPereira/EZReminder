import 'package:ez_reminder/components/app_layout.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  Perfil({super.key});

  final usuario = UsuarioService().getUsuario();

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        content: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Text("Você está logado como:",
                      style: TextStyle(
                          color: Color(
                            EzreminderColors.branco,
                          ),
                          fontSize: 20))),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Text("Nome: ${usuario!.displayName!}",
                      style: TextStyle(
                          color: Color(
                            EzreminderColors.branco,
                          ),
                          fontSize: 20))),
              Text(
                "Email: ${usuario!.email!}",
                style: TextStyle(
                    color: Color(EzreminderColors.branco), fontSize: 20),
              )
            ],
          )
        ],
      ),
    )));
  }
}
