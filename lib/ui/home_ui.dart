import 'package:challenge_flutter/widget/background_view.dart';
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
    return BackgroundView(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: 150),
                SizedBox(height: 50),
                Text("Bem-vindo", style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 5),
                Text(
                  "Realize o cadastro de sua empresa de forma facil e agil!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                TextFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
