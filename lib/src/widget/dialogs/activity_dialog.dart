import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:challenge_flutter/src/widget/inputs/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ActivityDialog extends StatefulWidget {
  final RequestActivityModel? data;

  const ActivityDialog({Key? key, this.data}) : super(key: key);

  @override
  _ActivityDialogState createState() => _ActivityDialogState();
}

class _ActivityDialogState extends State<ActivityDialog> {
  late GlobalKey<FormState> _form;
  late RequestActivityModel _data;
  late TextEditingController _codeController;

  @override
  void initState() {
    _data = widget.data ?? RequestActivityModel();
    _form = GlobalKey();
    _codeController =
        MaskedTextController(mask: '00.00-0-00', text: _data.code);
    super.initState();
  }

  void _submit() {
    if (_form.currentState != null && _form.currentState!.validate()) {
      _form.currentState!.save();
      Navigator.pop(context, _data);
    }
  }

  String? _validIsNull(String? value) {
    if (value == null || value.isEmpty)
      return translate(Keys.error_required_field);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translate(Keys.label_form_activity_title_text)),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            TextFormInput(
              label: translate(Keys.label_form_activity_description_label_text),
              initialValue: _data.description,
              onSaved: (value) => _data.description = value,
              validation: _validIsNull,
            ),
            TextFormInput(
              label: translate(Keys.label_form_activity_code_label_text),
              controller: _codeController,
              onSaved: (value) => _data.code = value,
              validation: _validIsNull,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: 50),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "app_btn",
        onPressed: _submit,
        label: Text(translate(Keys.label_save_button)),
      ),
    );
  }
}
