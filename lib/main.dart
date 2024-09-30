import 'package:ez_reminder/screens/home.dart';
import 'package:ez_reminder/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EzReminder());
}

class EzReminder extends StatelessWidget {
  const EzReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "EZReminder", home: Login(key: key));
  }
}
