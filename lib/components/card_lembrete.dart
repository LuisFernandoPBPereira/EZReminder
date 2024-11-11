import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class CardLembrete extends StatelessWidget {
  final String titulo;
  final String tipoLembrete;
  final VoidCallback onPresssed;

  const CardLembrete(
      {super.key,
      required this.titulo,
      required this.tipoLembrete,
      required this.onPresssed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 25, 40, 25),
      child: SizedBox(
        width: 300,
        height: 120,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(EzreminderColors.backgroundPreto),
                elevation: 20,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)))),
            onPressed: onPresssed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titulo,
                      style: TextStyle(color: Color(EzreminderColors.branco)),
                    ),
                    Icon(
                      Icons.edit,
                      color: Color(EzreminderColors.branco),
                    )
                  ],
                ),
                Text(
                  "Tipo do lembrete: $tipoLembrete",
                  style: TextStyle(color: Color(EzreminderColors.branco)),
                  textAlign: TextAlign.left,
                )
              ],
            )),
      ),
    );
  }
}
