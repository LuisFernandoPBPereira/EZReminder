import 'package:ez_reminder/components/custom_button.dart';
import 'package:ez_reminder/components/dropdown.dart';
import 'package:ez_reminder/components/sidebar.dart';
import 'package:ez_reminder/components/titulo.dart';
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
          title: const Text('Selecione uma cor'),
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
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        timeText.value = 'Hora selecionada: ${pickedTime.format(context)}';
      }
    }

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          dateText.value =
              'Data selecionada: ${picked.day}/${picked.month}/${picked.year}';
        });
      }
    }

    @override
    // ignore: unused_element
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
                const Titulo(texto: "Criar Lembrete"),
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
                    child: Dropdown(
                      items: const [
                        {"id": 1, "tipoLembrete": "Academia"},
                        {"id": 2, "tipoLembrete": "Trabalho"},
                        {"id": 3, "tipoLembrete": "Faculdade"}
                      ],
                      hint: "Selecione um tipo de lembrete",
                      displayKey: "tipoLembrete",
                      onChanged: (a) => {},
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
                    child: CustomButton(
                        label: "Escolher Cor",
                        onPressed: () => pickColor(context))),
                ValueListenableBuilder<String>(
                  valueListenable: timeText,
                  builder: (context, value, child) {
                    return Text(
                      value,
                      style: const TextStyle(
                          fontSize: 18, color: Color(0xFFFFFFFF)),
                    );
                  },
                ),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    child: CustomButton(
                        label: "Escolher Horário",
                        onPressed: () => selectTime(context))),
                ValueListenableBuilder<String>(
                  valueListenable: dateText,
                  builder: (context, value, child) {
                    return Text(
                      value,
                      style: const TextStyle(
                          fontSize: 18, color: Color(0xFFFFFFFF)),
                    );
                  },
                ),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    child: CustomButton(
                        label: "Escolher Data",
                        onPressed: () => selectDate(context))),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: CustomButton(label: "Salvar", onPressed: () {})),
              ],
            ),
          ),
          drawer: Sidebar()),
    );
  }
}
