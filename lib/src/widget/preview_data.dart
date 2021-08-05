import 'package:challenge_flutter/src/widget/preview_header.dart';
import 'package:challenge_flutter/src/widget/preview_item.dart';
import 'package:flutter/material.dart';

class PreviewData extends StatelessWidget {
  const PreviewData({Key? key}) : super(key: key);

  void _useData(BuildContext context) async {
    var cancelBtn = TextButton(
        onPressed: () => Navigator.pop(context, false), child: Text("Não"));
    var confirmBtn = TextButton(
        onPressed: () => Navigator.pop(context, true), child: Text("Sim"));

    var alert = AlertDialog(
      content: Text("Deseja usar as informações desta empresa como cadastro?"),
      actions: [cancelBtn, confirmBtn],
    );

    var result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return alert;
      },
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text("Informações da Empresa"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PreviewHeader(label: "Dados Gerais"),
              PreviewItem(
                value: 'Razão Social',
                label: 'Razão Social',
              ),
              PreviewItem(
                value: 'Fantasia',
                label: 'Fantasia',
              ),
              PreviewItem(
                value: '00.000.000/0000-00',
                label: 'CNPJ',
              ),
              Row(
                children: [
                  PreviewItem(
                    value: 'MATRIZ',
                    label: 'Tipo',
                  ),
                  PreviewItem(
                    value: '01/01/2000',
                    label: 'Data de Abertura',
                  ),
                ],
              ),
              PreviewHeader(label: "Endereço"),
              PreviewItem(
                value: 'Logradouro',
                label: 'Logradouro',
              ),
              PreviewItem(
                value: 'Bairro',
                label: 'Bairro',
              ),
              Row(
                children: [
                  PreviewItem(
                    value: 'Número',
                    label: 'Número',
                  ),
                  PreviewItem(
                    value: '00.000-000',
                    label: 'CEP',
                  ),
                ],
              ),
              Row(
                children: [
                  PreviewItem(
                    flex: 3,
                    value: 'Município',
                    label: 'Município',
                  ),
                  PreviewItem(
                    value: 'UF',
                    label: 'UF',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(height: 50),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _useData(context),
        label: Text("Cadastrar empresa"),
      ),
    );
  }
}
