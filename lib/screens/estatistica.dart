import 'package:EZReminder/components/app_layout.dart';
import 'package:EZReminder/components/titulo.dart';
import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/models/estatistica_model.dart';
import 'package:EZReminder/models/lembrete_model.dart';
import 'package:EZReminder/services/lembrete_service.dart';
import 'package:flutter/material.dart';

class Estatistica extends StatefulWidget {
  @override
  State<Estatistica> createState() => _EstatisticaState();
}

class _EstatisticaState extends State<Estatistica> {
  LembreteService lembreteService = LembreteService();
  int count = 0;
  List<LembreteModel> lembretes = [];

  @override
  void initState() {
    super.initState();
    getCountLembretes(); // Chamar o método no initState
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Titulo(
              texto: "Estatísticas",
            ),
            StreamBuilder(
                stream: lembreteService.getEstatisticaToWidget(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Color(EzreminderColors.primaryVerde),
                    ));
                  } else {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.docs.isNotEmpty) {
                      List<EstatisticaModel> estatisticas = [];

                      for (var doc in snapshot.data!.docs) {
                        estatisticas.add(EstatisticaModel.fromMap(doc.data()));
                      }

                      return Column(
                          children: estatisticas.map((estatistica) {
                        return Container(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)))),
                                onPressed: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${estatistica.lembretesConcluidos}",
                                      style: TextStyle(
                                          color: Color(
                                              EzreminderColors.primaryVerde),
                                          fontSize: 40),
                                    ),
                                    Text(
                                      "Lembretes concluídos",
                                      style: TextStyle(
                                          color: Color(EzreminderColors.branco),
                                          fontSize: 16),
                                    )
                                  ],
                                )),
                          ),
                        );
                      }).toList());
                    } else {
                      return Center(
                          child: Text(
                        "Não há estatísticas",
                        style: TextStyle(color: Color(EzreminderColors.branco)),
                      ));
                    }
                  }
                }),
            Container(
              margin: const EdgeInsets.fromLTRB(60, 25, 60, 25),
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
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${count}",
                          style:
                              TextStyle(color: Colors.amber[400], fontSize: 40),
                        ),
                        Text(
                          "Lembretes pendentes",
                          style: TextStyle(
                              color: Color(EzreminderColors.branco),
                              fontSize: 16),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getCountLembretes() async {
    List<LembreteModel> fetchedLembretes =
        await lembreteService.getListLembretes();

    setState(() {
      lembretes = fetchedLembretes;
      count = fetchedLembretes.length; // Atualiza a contagem
    });
  }
}
