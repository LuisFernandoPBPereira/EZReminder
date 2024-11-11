import 'package:ez_reminder/components/sidebar.dart';
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
              Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    "Meus Lembretes",
                    style: TextStyle(
                        color: Color(EzreminderColors.branco),
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 50, 40, 25),
                child: SizedBox(
                  width: 300,
                  height: 120,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(EzreminderColors.backgroundPreto),
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)))),
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Lembrete 1",
                                style: TextStyle(
                                    color: Color(EzreminderColors.branco)),
                              ),
                              Icon(
                                Icons.edit,
                                color: Color(EzreminderColors.branco),
                              )
                            ],
                          ),
                          Text(
                            "Tipo do lembrete: Tipo",
                            style: TextStyle(
                                color: Color(EzreminderColors.branco)),
                            textAlign: TextAlign.left,
                          )
                        ],
                      )),
                ),
              )
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
