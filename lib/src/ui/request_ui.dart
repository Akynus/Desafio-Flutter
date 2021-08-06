import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/ui/form_ui.dart';
import 'package:challenge_flutter/src/widget/dialogs/preview_dialog.dart';
import 'package:challenge_flutter/src/widget/request_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestUI extends StatefulWidget {
  const RequestUI({Key? key}) : super(key: key);

  static final route = "/request";

  @override
  _RequestUIState createState() => _RequestUIState();
}

class _RequestUIState extends State<RequestUI> {
  void _onNewCompany() {
    Navigator.pushNamed(context, FormUI.route);
  }

  void _previewData(RequestModel value) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PreviewDialog(data: value)),
    );

    if (result == true)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FormUI(data: value),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    var keyboardOpened = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: SingleChildScrollView(
        physics: keyboardOpened ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Hero(
                    tag: "app_logo",
                    child: FlutterLogo(size: 120),
                  ),
                ),
                Expanded(
                  child: RequestForm(
                    onData: _previewData,
                    onNew: _onNewCompany,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
