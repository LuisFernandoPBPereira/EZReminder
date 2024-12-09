import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/screens/configuracoes.dart';
import 'package:EZReminder/screens/criar_lembrete.dart';
import 'package:EZReminder/screens/home.dart';
import 'package:EZReminder/screens/perfil.dart';
import 'package:EZReminder/screens/planos.dart';
import 'package:EZReminder/screens/login.dart';
import 'package:EZReminder/services/auth_service.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(EzreminderColors.backgroundPreto),
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Olá, ${AuthService().getUsuario()?.displayName ?? AuthService().getUsuario()?.email}",
                  style: TextStyle(
                    color: Color(EzreminderColors.branco),
                  ))
            ],
          )),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(EzreminderColors.branco),
            ),
            title: Text(
              "Meus Lembretes",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications,
                color: Color(EzreminderColors.branco)),
            title: Text(
              "Criar Lembrete",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CriarLembrete()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle,
                color: Color(EzreminderColors.branco)),
            title: Text(
              "Perfil",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.auto_fix_high,
                color: Color(EzreminderColors.branco)),
            title: Text(
              "Gerenciar Planos",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Planos()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.settings, color: Color(EzreminderColors.branco)),
            title: Text(
              "Configurações",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Configuracoes()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Color(EzreminderColors.branco)),
            title: Text(
              "Sair",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              AuthService().deslogarUsuario();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
