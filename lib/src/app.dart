import 'package:challenge_flutter/src/resources/theme.dart';
import 'package:challenge_flutter/src/ui/home_ui.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: HomeUI(),
    );
  }
}
