import 'package:ez_reminder/screens/email_redefinicao_de_senha.dart';
import 'package:ez_reminder/screens/home.dart';
import 'package:ez_reminder/screens/login.dart';
import 'package:ez_reminder/screens/nova_senha.dart';
import 'package:ez_reminder/screens/redefinicao_de_senha.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EzReminder());
}

class EzReminder extends StatelessWidget {
  const EzReminder({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     debugShowCheckedModeBanner: false, title: "EZReminder", home: Login());
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: "EZReminder", home: Home());
    // return MaterialApp(title: "EZReminder", home: EmailRedefinicaoDeSenha());
    // return MaterialApp(title: "EZReminder", home: NovaSenha());
  }
}
