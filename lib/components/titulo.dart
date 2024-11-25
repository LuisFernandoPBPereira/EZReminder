import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String texto;

  const Titulo({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
        child: Text(
          texto,
          style: TextStyle(
              color: Color(EzreminderColors.branco),
              fontSize: 32,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}
