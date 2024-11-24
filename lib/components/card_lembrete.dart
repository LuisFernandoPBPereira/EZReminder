import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class CardLembrete extends StatelessWidget {
  final int id;
  final int usuarioId;
  final String titulo;
  final String descricao;
  final String tipoLembrete;
  final int cor;
  final String hora;
  final DateTime data;
  final String localizacao;

  final VoidCallback onPresssed;

  const CardLembrete(
      {super.key,
      required this.id,
      required this.usuarioId,
      required this.titulo,
      required this.descricao,
      required this.tipoLembrete,
      required this.cor,
      required this.hora,
      required this.data,
      required this.localizacao,
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
                backgroundColor: Color(cor),
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
                      style: TextStyle(
                        color: Color(EzreminderColors.branco),
                        shadows: const [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Color(EzreminderColors.branco),
                    )
                  ],
                ),
                Text(
                  "Tipo do lembrete: $tipoLembrete",
                  style: TextStyle(
                    color: Color(EzreminderColors.branco),
                    shadows: const [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.black,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            )),
      ),
    );
  }
}
