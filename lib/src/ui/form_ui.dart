import 'package:flutter/material.dart';

class FormUI extends StatefulWidget {
  const FormUI({Key? key}) : super(key: key);

  static final route = "/form";

  @override
  _FormUIState createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  Future<bool> _willPop() async {
    var cancelBtn = TextButton(
        onPressed: () => Navigator.pop(context, false), child: Text("Não"));
    var confirmBtn = TextButton(
        onPressed: () => Navigator.pop(context, true), child: Text("Sim"));

    var alert = AlertDialog(
      title: Text("Fechar formulário"),
      content: Text("As informações preenchidas serão perdidas. Deseja continuar?"),
      actions: [cancelBtn, confirmBtn],
    );

    var result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return alert;
      },
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: Text("Formulário"),
        ),
      ),
    );
  }
}
