import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class CardTipoDeLembrete extends StatelessWidget {
  final String titulo;

  const CardTipoDeLembrete({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 25, 40, 25),
      child: SizedBox(
        width: 300,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(EzreminderColors.backgroundPreto),
                elevation: 20,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)))),
            onPressed: () {},
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
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Color(EzreminderColors.branco),
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Color(EzreminderColors.branco),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
