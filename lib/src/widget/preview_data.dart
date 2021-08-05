import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/widget/preview_header.dart';
import 'package:challenge_flutter/src/widget/preview_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PreviewData extends StatelessWidget {
  final RequestModel data;

  const PreviewData({Key? key, required this.data}) : super(key: key);

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
    if (result == true) Navigator.pop(context, true);
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
                value: data.name ?? "-",
                label: 'Razão Social',
              ),
              PreviewItem(
                value: data.nickname ?? "-",
                label: 'Fantasia',
              ),
              PreviewItem(
                value: data.nfi ?? "-",
                label: 'CNPJ',
              ),
              Row(
                children: [
                  PreviewItem(
                    value: describeEnum(data.type ?? "-"),
                    label: 'Tipo',
                  ),
                  PreviewItem(
                    value: data.opening ?? "-",
                    label: 'Data de Abertura',
                  ),
                ],
              ),
              PreviewHeader(label: "Endereço"),
              PreviewItem(
                value: data.address ?? "-",
                label: 'Logradouro',
              ),
              PreviewItem(
                value: data.neighborhood ?? "-",
                label: 'Bairro',
              ),
              Row(
                children: [
                  PreviewItem(
                    value: data.number ?? "-",
                    label: 'Número',
                  ),
                  PreviewItem(
                    value: data.cep ?? "-",
                    label: 'CEP',
                  ),
                ],
              ),
              Row(
                children: [
                  PreviewItem(
                    flex: 3,
                    value: data.city ?? "-",
                    label: 'Município',
                  ),
                  PreviewItem(
                    value: data.uf ?? "-",
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
        heroTag: "app_btn",
        onPressed: () => _useData(context),
        label: Text("Cadastrar empresa"),
      ),
    );
  }
}
