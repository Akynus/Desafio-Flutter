import 'package:challenge_flutter/src/resources/translate.dart';
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
  void _onNewCompany() {}

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
                  child: Center(
                    child: FlutterLogo(size: 120),
                  ),
                ),
                Expanded(
                  child: RequestForm(
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
