import 'package:intl/intl.dart';

extension ExtensionString on String {
  String get onlyNumbers {
    return this.replaceAll(RegExp('[^0-9]'), '');
  }
}

extension ExtensionDateTime on DateTime {
  String get toLocalString {
    final format = new DateFormat('dd/MM/yyyy');
    return format.format(this);
  }
}
