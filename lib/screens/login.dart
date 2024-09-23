import 'package:ez_reminder/components/sections/header-login.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HeaderLogin());
  }
}
