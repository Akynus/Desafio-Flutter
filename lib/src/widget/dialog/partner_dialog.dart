import 'dart:convert';

import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:challenge_flutter/src/widget/inputs/text_form_input.dart';
import 'package:flutter/material.dart';

class PartnerDialog extends StatefulWidget {
  final RequestPartnerModel? data;

  const PartnerDialog({Key? key, this.data}) : super(key: key);

  @override
  _PartnerDialogState createState() => _PartnerDialogState();
}

class _PartnerDialogState extends State<PartnerDialog> {
  late GlobalKey<FormState> _form;
  late RequestPartnerModel _data;

  @override
  void initState() {
    _data = widget.data ?? RequestPartnerModel();
    _form = GlobalKey();
    super.initState();
  }

  void _submit() {
    if (_form.currentState != null && _form.currentState!.validate()) {
      _form.currentState!.save();
      Navigator.pop(context, _data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sócio"),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            TextFormInput(
              label: "Nome do sócio",
              initialValue: _data.name,
              onSaved: (value) => _data.name = value,
              validation: (value) {
                if (value == null || value.isEmpty) return translate(Keys.error_required_field);
                return null;
              },
            ),
            TextFormInput(
              label: "Qualificação do sócio",
              initialValue: _data.type,
              onSaved: (value) => _data.type = value,
            ),
            TextFormInput(
              label: "País de origem do sócio",
              initialValue: _data.originCountry,
              onSaved: (value) => _data.originCountry = value,
            ),
            TextFormInput(
              label: "Nome do representante legal",
              initialValue: _data.legalName,
              onSaved: (value) => _data.legalName = value,
            ),
            TextFormInput(
              label: "Qualificação do representante legal",
              initialValue: _data.legalType,
              onSaved: (value) => _data.legalType = value,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: 50),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "app_btn",
        onPressed: _submit,
        label: Text("Salvar"),
      ),
    );
  }
}
