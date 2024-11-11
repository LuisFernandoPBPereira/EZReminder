import 'package:ez_reminder/components/card_lembrete.dart';
import 'package:ez_reminder/components/sidebar.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/screens/criar_lembrete.dart';
import 'package:ez_reminder/screens/login.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(EzreminderColors.backgroundPreto),
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Color(EzreminderColors.primaryVerde),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: 50,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: const [
            Icon(
              Icons.notifications,
              size: 50,
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Titulo(
                texto: "Meus Lembretes",
              ),
              CardLembrete(
                  titulo: 'Lembrete 1',
                  tipoLembrete: 'Faculdade',
                  onPresssed: () {})
            ],
          ),
        ),
        drawer: Sidebar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CriarLembrete()),
            );
          },
          child: Icon(Icons.add, size: 40),
          backgroundColor: Color(EzreminderColors.primaryVerde),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
