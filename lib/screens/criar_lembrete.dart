import 'package:EZReminder/components/custom_button.dart';
import 'package:EZReminder/components/custom_notification.dart';
import 'package:EZReminder/components/custom_snackbar.dart';
import 'package:EZReminder/components/sidebar.dart';
import 'package:EZReminder/components/titulo.dart';
import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/global/plano_config.dart';
import 'package:EZReminder/models/lembrete_model.dart';
import 'package:EZReminder/screens/home.dart';
import 'package:EZReminder/services/lembrete_service.dart';
import 'package:EZReminder/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class CriarLembrete extends StatefulWidget {
  const CriarLembrete({super.key});

  @override
  _CriarLembreteState createState() => _CriarLembreteState();
}

class _CriarLembreteState extends State<CriarLembrete> {
  LembreteService lembreteService = LembreteService();
  TextEditingController nomeDoLembrete = TextEditingController();
  TextEditingController descricaoDoLembrete = TextEditingController();
  TextEditingController tipoDoLembrete = TextEditingController();
  TextEditingController localizacao = TextEditingController();
  ValueNotifier<String> dateText = ValueNotifier('Nenhuma data selecionada');
  ValueNotifier<String> timeText = ValueNotifier('Nenhuma hora selecionada');
  String tipoLembrete = "";
  Map<String, dynamic> selectedItem = <String, dynamic>{};
  DateTime? selectedDate;
  TimeOfDay? horaSelecionada;

  Color selectedColor = Colors.blue;

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
              child: const Text('Selecionar'),
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
    Future<void> selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        horaSelecionada = pickedTime;
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
          selectedDate = picked;
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
                  margin: const EdgeInsets.only(bottom: 25),
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
                Visibility(
                  visible: PlanoConfig.planoConfig == Plano.premium,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 0),
                      child: TextField(
                        controller: localizacao,
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(color: Color(EzreminderColors.branco)),
                          labelText: "Localização",
                          border: const UnderlineInputBorder(),
                        ),
                        style: const TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Cor selecionada:',
                  style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
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
                    child: CustomButton(
                        label: "Salvar", onPressed: () => adicionarLembrete())),
              ],
            ),
          ),
          drawer: Sidebar()),
    );
  }

  adicionarLembrete() {
    if (!lembreteValido()) return;

    print(localizacao.text);

    LembreteModel lembrete = LembreteModel(
        id: const Uuid().v1(),
        nome: nomeDoLembrete.text,
        descricao: descricaoDoLembrete.text,
        tipoLembrete: tipoDoLembrete.text,
        cor: selectedColor.value,
        hora: "${horaSelecionada?.hour}:${horaSelecionada?.minute}",
        data: DateFormat("yyyy-MM-dd").format(selectedDate!),
        localizacao: localizacao.text);

    lembreteService.adicionarLembrete(lembrete).then((value) {
      setState(() {
        Provider.of<NotificationService>(context, listen: false)
            .showNotification(CustomNotification(
                id: 1,
                title: lembrete.nome,
                body: lembrete.descricao,
                date: DateTime(
                    selectedDate!.year,
                    selectedDate!.month,
                    selectedDate!.day,
                    horaSelecionada!.hour,
                    horaSelecionada!.minute)));
      });
      mostrarSnackBar(
          context: context,
          texto: "Lembrete criado com sucesso!",
          isErro: false);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  lembreteValido() {
    if (nomeDoLembrete.text.isEmpty) {
      mostrarSnackBar(
          context: context, texto: "É preciso dar um nome para o lembrete");
      return false;
    }

    if (descricaoDoLembrete.text.isEmpty) {
      mostrarSnackBar(
          context: context,
          texto: "É preciso dar uma descrição para o lembrete");
      return false;
    }

    if (tipoDoLembrete.text.isEmpty) {
      mostrarSnackBar(
          context: context, texto: "É preciso dar um tipo para o lembrete");
      return false;
    }

    if (horaSelecionada == null) {
      mostrarSnackBar(
          context: context, texto: "É preciso dar um horário para o lembrete");
      return false;
    }

    if (selectedDate == null) {
      mostrarSnackBar(
          context: context, texto: "É preciso dar uma data para o lembrete");
      return false;
    }

    return true;
  }
}
