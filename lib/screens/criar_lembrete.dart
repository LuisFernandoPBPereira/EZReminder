import 'package:ez_reminder/components/sidebar.dart';
import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CriarLembrete extends StatefulWidget {
  const CriarLembrete({super.key});

  @override
  _CriarLembreteState createState() => _CriarLembreteState();
}

class _CriarLembreteState extends State<CriarLembrete> {
  ValueNotifier<String> dateText = ValueNotifier('Nenhuma data selecionada');
  ValueNotifier<String> timeText = ValueNotifier('Nenhuma hora selecionada');

  Color selectedColor = Colors.blue; // Cor inicial

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione uma cor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Selecionar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;

    Future<void> selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(), // Hora inicial
      );
      if (pickedTime != null) {
        // Atualiza o texto com a hora selecionada
        timeText.value = 'Hora selecionada: ${pickedTime.format(context)}';
      }
    }

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(), // Data inicial
        firstDate: DateTime(2000), // Primeira data disponível
        lastDate: DateTime(2100), // Última data disponível
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          dateText.value =
              'Data selecionada: ${picked.day}/${picked.month}/${picked.year}';
        });
      }
    }

    @override
    void dispose() {
      timeText.dispose();
      dateText.dispose();
      super.dispose();
    }

    TextEditingController nomeDoLembrete = TextEditingController();
    TextEditingController descricaoDoLembrete = TextEditingController();
    TextEditingController tipoDoLembrete = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 45),
                    child: Text(
                      "Criar Lembrete",
                      style: TextStyle(
                          color: Color(EzreminderColors.branco),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 0),
                    child: TextField(
                      controller: nomeDoLembrete,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Color(EzreminderColors.branco)),
                        labelText: "Nome do Lembrete",
                        border: const UnderlineInputBorder(),
                      ),
                      style: const TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 0),
                    child: TextField(
                      controller: descricaoDoLembrete,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Color(EzreminderColors.branco)),
                        labelText: "Descrição do Lembrete",
                        border: const UnderlineInputBorder(),
                      ),
                      style: const TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 0),
                    child: TextField(
                      controller: tipoDoLembrete,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Color(EzreminderColors.branco)),
                        labelText: "Tipo do Lembrete",
                        border: const UnderlineInputBorder(),
                      ),
                      style: const TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                const Text(
                  'Cor selecionada:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      pickColor(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(EzreminderColors.primaryVerde),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      fixedSize: const Size(245, 49),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    child: Text(
                      "Escolher Cor",
                      style: TextStyle(
                          color: Color(EzreminderColors.backgroundPreto)),
                    ),
                  ),
                ),
                ValueListenableBuilder<String>(
                  valueListenable: timeText,
                  builder: (context, value, child) {
                    return Text(
                      value,
                      style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
                    );
                  },
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      selectTime(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(EzreminderColors.primaryVerde),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      fixedSize: const Size(245, 49),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    child: Text(
                      "Escolher Horário",
                      style: TextStyle(
                          color: Color(EzreminderColors.backgroundPreto)),
                    ),
                  ),
                ),
                ValueListenableBuilder<String>(
                  valueListenable: dateText,
                  builder: (context, value, child) {
                    return Text(
                      value,
                      style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
                    );
                  },
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(EzreminderColors.primaryVerde),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      fixedSize: const Size(245, 49),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    child: Text(
                      "Escolher Data",
                      style: TextStyle(
                          color: Color(EzreminderColors.backgroundPreto)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(EzreminderColors.primaryVerde),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      fixedSize: const Size(245, 49),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          color: Color(EzreminderColors.backgroundPreto)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Sidebar()),
    );
  }
}
