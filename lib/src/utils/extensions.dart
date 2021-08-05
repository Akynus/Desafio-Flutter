extension ExtensionString on String {
  String get onlyNumbers {
    return this.replaceAll(RegExp('[^0-9]'), '');
  }
}