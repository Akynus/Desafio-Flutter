import 'package:challenge_flutter/src/widget/search_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  static final route = "/home";

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    var keyboardOpened = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: SingleChildScrollView(
        physics: keyboardOpened
            ? ClampingScrollPhysics()
            : NeverScrollableScrollPhysics(),
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
                  flex: 3,
                  child: Center(
                    child: FlutterLogo(size: 120),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      children: [
                        Text("Bem-vindo",
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(height: 5),
                        Text(
                          "Realize o cadastro de sua empresa de forma facil e agil!",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SearchForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
