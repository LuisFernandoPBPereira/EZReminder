import 'package:ez_reminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class EmailRedefinicaoDeSenha extends StatefulWidget {
  @override
  _EmailRedefinicaoDeSenhaState createState() =>
      _EmailRedefinicaoDeSenhaState();
}

class _EmailRedefinicaoDeSenhaState extends State<EmailRedefinicaoDeSenha> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  final _focusNode4 = FocusNode();
  final _focusNode5 = FocusNode();
  final _focusNode6 = FocusNode();
  final _focusNode7 = FocusNode();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    _focusNode7.dispose();
    super.dispose();
  }

  void _handleInputChange(TextEditingController controller,
      FocusNode currentNode, FocusNode nextNode) {
    if (controller.text.length == 1) {
      // Move o foco para o próximo campo
      currentNode.unfocus();
      FocusScope.of(context).requestFocus(nextNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(EzreminderColors.backgroundPreto),
      body: Container(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 50),
                child: Image.asset("Logo.png")),
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Icon(Icons.email_outlined,
                    color: Color(0xFFFFFFFF), size: 48)),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: const Text(
                "Código Enviado",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(50, 0, 50, 85),
              child: const Text(
                "Digite o código de verificação enviado para o email cadastrado",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: const Text(
                "Digite o código aqui",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SizedBox(
                    width: 40,
                    height: 44,
                    child: TextField(
                      controller: _controller1,
                      focusNode: _focusNode1,
                      maxLength: 1,
                      onChanged: (value) {
                        _handleInputChange(
                            _controller1, _focusNode1, _focusNode2);
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFA9A9A9),
                        counterText: "",
                      ),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SizedBox(
                    width: 40,
                    height: 44,
                    child: TextField(
                      controller: _controller2,
                      focusNode: _focusNode2,
                      maxLength: 1,
                      onChanged: (value) {
                        _handleInputChange(
                            _controller2, _focusNode2, _focusNode3);
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFA9A9A9),
                          counterText: ""),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SizedBox(
                    width: 40,
                    height: 44,
                    child: TextField(
                      controller: _controller3,
                      focusNode: _focusNode3,
                      maxLength: 1,
                      onChanged: (value) {
                        _handleInputChange(
                            _controller3, _focusNode3, _focusNode4);
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFA9A9A9),
                          counterText: ""),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SizedBox(
                    width: 40,
                    height: 44,
                    child: TextField(
                      controller: _controller4,
                      focusNode: _focusNode4,
                      maxLength: 1,
                      onChanged: (value) {
                        _handleInputChange(
                            _controller4, _focusNode4, _focusNode5);
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFA9A9A9),
                          counterText: ""),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SizedBox(
                    width: 40,
                    height: 44,
                    child: TextField(
                      controller: _controller5,
                      focusNode: _focusNode5,
                      maxLength: 1,
                      onChanged: (value) {
                        _handleInputChange(
                            _controller5, _focusNode5, _focusNode6);
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFA9A9A9),
                          counterText: ""),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: SizedBox(
                    width: 40,
                    height: 44,
                    child: TextField(
                      controller: _controller6,
                      focusNode: _focusNode6,
                      maxLength: 1,
                      onChanged: (value) {
                        _handleInputChange(
                            _controller6, _focusNode6, _focusNode7);
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFA9A9A9),
                          counterText: ""),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(95, 40, 95, 100),
              child: SizedBox(
                width: 245,
                height: 49,
                child: ElevatedButton(
                  focusNode: _focusNode7,
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(EzreminderColors.primaryVerde),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  child: Text(
                    "Confirmar",
                    style: TextStyle(
                        color: Color(EzreminderColors.backgroundPreto),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Não recebeu?",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Enviar código novamente",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
