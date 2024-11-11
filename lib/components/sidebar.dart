import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/criar_lembrete.dart';
import 'package:ez_reminder/screens/home.dart';
import 'package:ez_reminder/screens/tipos_de_lembrete.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(EzreminderColors.backgroundPreto),
      child: ListView(
        children: [
          DrawerHeader(child: Text("Cabeçalho")),
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
            leading: Icon(Icons.note, color: Color(EzreminderColors.branco)),
            title: Text(
              "Tipos de Lembrete",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TiposDeLembrete()),
              );
            },
          ),
          ListTile(
            leading:
                Icon(Icons.note_add, color: Color(EzreminderColors.branco)),
            title: Text(
              "Criar Tipo do Lembrete",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:
                Icon(Icons.schedule, color: Color(EzreminderColors.branco)),
            title: Text(
              "Cronograma",
              style: TextStyle(color: Color(EzreminderColors.branco)),
            ),
            onTap: () {
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
