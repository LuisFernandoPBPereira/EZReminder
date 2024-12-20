import 'package:EZReminder/components/app_layout.dart';
import 'package:EZReminder/components/custom_button.dart';
import 'package:EZReminder/components/custom_snackbar.dart';
import 'package:EZReminder/components/titulo.dart';
import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:EZReminder/global/plano_config.dart';
import 'package:EZReminder/models/lembrete_model.dart';
import 'package:EZReminder/screens/home.dart';
import 'package:EZReminder/services/lembrete_service.dart';
import 'package:EZReminder/utils/time_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class EditarLembrete extends StatefulWidget {
  final LembreteModel lembreteModel;

  const EditarLembrete({super.key, required this.lembreteModel});

  @override
  _EditarLembreteState createState() =>
      _EditarLembreteState(lembreteModel: lembreteModel);
}

class _EditarLembreteState extends State<EditarLembrete> {
  var lembreteService = LembreteService();
  final LembreteModel lembreteModel;
  Color selectedColor = Colors.blue;
  ValueNotifier<String> dateText = ValueNotifier('Nenhuma data selecionada');
  ValueNotifier<String> timeText = ValueNotifier('Nenhuma hora selecionada');
  TextEditingController nomeDoLembrete = TextEditingController();
  TextEditingController descricaoDoLembrete = TextEditingController();
  TextEditingController tipoDoLembrete = TextEditingController();
  TextEditingController localizacao = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? horaSelecionada;

  _EditarLembreteState({required this.lembreteModel});

  @override
  void initState() {
    nomeDoLembrete.text = lembreteModel.nome;
    descricaoDoLembrete.text = lembreteModel.descricao;
    tipoDoLembrete.text = lembreteModel.tipoLembrete;
    localizacao.text = lembreteModel.localizacao ?? "";
    selectedColor = Color(lembreteModel.cor);
    selectedDate = DateTime.parse(lembreteModel.data);
    horaSelecionada = parseTimeOfDay(lembreteModel.hora);
    dateText.value =
        'Data selecionada: ${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}';
    timeText.value =
        'Hora selecionada: ${horaSelecionada?.hour}:${horaSelecionada?.minute}';
    super.initState();
  }

  void pickColor(BuildContext context) {
    selectedColor = Color(lembreteModel.cor);
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
        timeText.value = 'Hora selecionada: ${pickedTime.format(context)}';
        horaSelecionada = pickedTime;
      } else {
        horaSelecionada = pickedTime!;
      }
    }

    Future<void> selectDate(BuildContext context) async {
      dateText.value = lembreteModel.data.toString();

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
          selectedDate = picked;
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

    return AppLayout(
        content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Titulo(texto: lembreteModel.nome),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: ElevatedButton(
              onPressed: () {
                lembreteService
                    .removerLembrete(idLembrete: lembreteModel.id)
                    .then((value) {
                  if (mounted) {
                    mostrarSnackBar(
                        context: context,
                        texto: "Lembrete removido com sucesso!",
                        isErro: false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(EzreminderColors.backgroundPreto),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                elevation: 20,
                fixedSize: const Size(245, 49),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              child: const Text(
                "Apagar Lembrete",
                style: TextStyle(color: Color(0xFFFF0000)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
              child: TextField(
                controller: nomeDoLembrete,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(EzreminderColors.branco)),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
              child: TextField(
                controller: descricaoDoLembrete,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(EzreminderColors.branco)),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
              child: TextField(
                controller: tipoDoLembrete,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(EzreminderColors.branco)),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 0),
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
          Text(
            'Cor selecionada:',
            style:
                TextStyle(fontSize: 18, color: Color(EzreminderColors.branco)),
          ),
          const SizedBox(height: 10),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: selectedColor, borderRadius: BorderRadius.circular(20)),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: CustomButton(
                  label: "Escolher Cor", onPressed: () => pickColor(context))),
          ValueListenableBuilder<String>(
            valueListenable: timeText,
            builder: (context, value, child) {
              return Text(
                value,
                style: const TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
              );
            },
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: CustomButton(
                  label: "Escolher Horário",
                  onPressed: () => selectTime(context))),
          ValueListenableBuilder<String>(
            valueListenable: dateText,
            builder: (context, value, child) {
              return Text(
                value,
                style: const TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
              );
            },
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: CustomButton(
                  label: "Escolher Data",
                  onPressed: () => selectDate(context))),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: CustomButton(
                  label: "Salvar", onPressed: () => editarLembrete())),
        ],
      ),
    ));
  }

  editarLembrete() {
    if (!lembreteValido()) return;

    LembreteModel lembrete = LembreteModel(
        id: lembreteModel.id,
        nome: nomeDoLembrete.text,
        descricao: descricaoDoLembrete.text,
        tipoLembrete: tipoDoLembrete.text,
        cor: selectedColor.value,
        hora: "${horaSelecionada?.hour}:${horaSelecionada?.minute}",
        data: DateFormat("yyyy-MM-dd").format(selectedDate!),
        localizacao: localizacao.text);

    lembreteService.adicionarLembrete(lembrete).then((value) {
      if (mounted) {
        mostrarSnackBar(
            context: context,
            texto: "Lembrete editado com sucesso!",
            isErro: false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
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
