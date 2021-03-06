import 'package:challenge_flutter/src/blocs/company/company_bloc.dart';
import 'package:challenge_flutter/src/blocs/request/request_bloc.dart';
import 'package:challenge_flutter/src/resources/theme.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:challenge_flutter/src/ui/form_ui.dart';
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
        RepositoryProvider(create: (_) => CompanyBloc()),
      ],
      child: child,
    );
  }

  ThemeData _theme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.indigo,
      fontFamily: "Barlow",
      scaffoldBackgroundColor: Colors.grey.shade200,
      cardTheme: CardTheme(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(17)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34),
            ),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black54),
        textTheme: TextTheme(
            headline6: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Colors.black54)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return _providerBloc(
      child: MaterialApp(
        title: translate(Keys.application_title),
        theme: _theme(context),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: [const Locale('pt','BR')],
        initialRoute: HomeUI.route,
        routes: {
          HomeUI.route: (_) => HomeUI(),
          RequestUI.route: (_) => RequestUI(),
          FormUI.route: (_) => FormUI(),
        },
      ),
    );
  }
}
