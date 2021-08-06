import 'package:challenge_flutter/src/app.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() async {
  Intl.defaultLocale = 'pt_BR';
  var delegate = await LocalizationDelegate.create(fallbackLocale: 'pt_BR', supportedLocales: ['pt_BR']);
  runApp(LocalizedApp(delegate, App()));
}
