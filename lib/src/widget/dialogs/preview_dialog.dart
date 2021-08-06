import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:challenge_flutter/src/widget/preview_header.dart';
import 'package:challenge_flutter/src/widget/preview_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PreviewDialog extends StatelessWidget {
  final RequestModel data;

  const PreviewDialog({Key? key, required this.data}) : super(key: key);

  void _useData(BuildContext context) async {
    var cancelBtn = TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: Text(translate(Keys.label_no_button)));
    var confirmBtn = TextButton(
        onPressed: () => Navigator.pop(context, true),
        child: Text(translate(Keys.label_yes_button)));

    var alert = AlertDialog(
      content: Text(translate(Keys.label_preview_dialog_description_text)),
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
        title: Text(translate(Keys.label_preview_title_text)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PreviewHeader(
                  label: translate(Keys.label_preview_general_header_text)),
              PreviewItem(
                value: data.name ?? "-",
                label: translate(Keys.label_preview_name_label_text),
              ),
              PreviewItem(
                value: data.nickname ?? "-",
                label: translate(Keys.label_preview_nickname_label_text),
              ),
              PreviewItem(
                value: data.nfi ?? "-",
                label: translate(Keys.label_preview_nfi_label_text),
              ),
              Row(
                children: [
                  PreviewItem(
                    value: describeEnum(data.type ?? "-"),
                    label: translate(Keys.label_preview_type_label_text),
                  ),
                  PreviewItem(
                    value: data.opening ?? "-",
                    label: translate(Keys.label_preview_opening_label_text),
                  ),
                ],
              ),
              PreviewHeader(
                  label: translate(Keys.label_preview_address_header_text)),
              PreviewItem(
                value: data.address ?? "-",
                label: translate(Keys.label_preview_address_label_text),
              ),
              PreviewItem(
                value: data.neighborhood ?? "-",
                label: translate(Keys.label_preview_neighborhood_label_text),
              ),
              Row(
                children: [
                  PreviewItem(
                    value: data.number ?? "-",
                    label: translate(Keys.label_preview_number_label_text),
                  ),
                  PreviewItem(
                    value: data.cep ?? "-",
                    label: translate(Keys.label_preview_cep_label_text),
                  ),
                ],
              ),
              Row(
                children: [
                  PreviewItem(
                    flex: 3,
                    value: data.city ?? "-",
                    label: translate(Keys.label_preview_city_label_text),
                  ),
                  PreviewItem(
                    value: data.uf ?? "-",
                    label: translate(Keys.label_preview_uf_label_text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(translate(Keys.label_close_button)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                heroTag: "app_btn",
                onPressed: () => _useData(context),
                label: Text(translate(Keys.label_preview_apply_button)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
