import 'package:ez_reminder/components/card_lembrete.dart';
import 'package:ez_reminder/components/sidebar.dart';
import 'package:ez_reminder/components/titulo.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:ez_reminder/models/lembrete_model.dart';
import 'package:ez_reminder/repository/lembrete_repository.dart';
import 'package:ez_reminder/repository/tipo_lembrete_repository.dart';
import 'package:ez_reminder/screens/criar_lembrete.dart';
import 'package:ez_reminder/screens/editar_lembrete.dart';
import 'package:ez_reminder/services/lembrete_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<LembreteModel> lembretes = LembreteRepository().getLembretes();
    LembreteService lembreteService = LembreteService();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(EzreminderColors.backgroundPreto),
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Color(EzreminderColors.primaryVerde),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
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
              StreamBuilder(
                  stream: lembreteService.getLembretes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text("Carregando..."),
                      );
                    } else {
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data!.docs.isNotEmpty) {
                        List<LembreteModel> lembretes = [];

                        for (var doc in snapshot.data!.docs) {
                          lembretes.add(LembreteModel.fromMap(doc.data()));
                        }

                        return Column(
                            children: lembretes.map((lembrete) {
                          return CardLembrete(
                              id: lembrete.id,
                              titulo: lembrete.nome,
                              descricao: lembrete.descricao,
                              tipoLembrete: lembrete.tipoLembrete,
                              cor: lembrete.cor,
                              hora: lembrete.hora,
                              data: lembrete.data,
                              localizacao: lembrete.localizacao ?? "",
                              onPresssed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditarLembrete(
                                      lembreteModel: lembrete,
                                    ),
                                  ),
                                );
                              });
                        }).toList());
                      } else {
                        return Center(
                            child: Text(
                          "Não há lembretes",
                          style:
                              TextStyle(color: Color(EzreminderColors.branco)),
                        ));
                      }
                    }
                  })
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
