import 'package:challenge_flutter/src/blocs/request/request_bloc.dart';
import 'package:challenge_flutter/src/resources/theme.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:challenge_flutter/src/ui/home_ui.dart';
import 'package:challenge_flutter/src/ui/request_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget _providerBloc({required Widget child}) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => RequestBloc()),
      ],
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return _providerBloc(
      child: MaterialApp(
        title: translate(Keys.application_title),
        theme: theme,
        localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, localizationDelegate],
        initialRoute: HomeUI.route,
        routes: {
          HomeUI.route: (_) => HomeUI(),
          RequestUI.route: (_) => RequestUI(),
        },
      ),
    );
  }
}
