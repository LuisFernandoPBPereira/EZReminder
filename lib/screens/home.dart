import 'package:EZReminder/components/app_layout.dart';
import 'package:EZReminder/components/card_lembrete.dart';
import 'package:EZReminder/components/sidebar.dart';
import 'package:EZReminder/components/titulo.dart';
import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/models/lembrete_model.dart';
import 'package:EZReminder/screens/criar_lembrete.dart';
import 'package:EZReminder/screens/editar_lembrete.dart';
import 'package:EZReminder/services/lembrete_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    LembreteService lembreteService = LembreteService();

    return AppLayout(
      customFloatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CriarLembrete()),
          );
        },
        child: Icon(Icons.add, size: 40),
        backgroundColor: Color(EzreminderColors.primaryVerde),
      ),
      content: SingleChildScrollView(
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
                    return Center(
                      child: Text(
                        "Carregando...",
                        style: TextStyle(color: Color(EzreminderColors.branco)),
                      ),
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
                        style: TextStyle(color: Color(EzreminderColors.branco)),
                      ));
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
