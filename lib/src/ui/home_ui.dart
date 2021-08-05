import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:challenge_flutter/src/ui/request_ui.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  static final route = "/";

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  void _goView() {
    Navigator.pushNamed(context, RequestUI.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: FlutterLogo(size: 120),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(translate(Keys.label_welcome_title_text), style: Theme.of(context).textTheme.headline2),
                    SizedBox(height: 5),
                    Text(
                      translate(Keys.label_welcome_description_text),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      heroTag: "app_btn",
                      onPressed: _goView,
                      label: Text(translate(Keys.label_go_request_view)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
