import 'package:challenge_flutter/src/models/company_model.dart';
import 'package:challenge_flutter/src/models/request_model.dart';

extension ExtensionString on String {
  String get onlyNumbers {
    return this.replaceAll(RegExp('[^0-9]'), '');
  }
}

extension RequestModelExtension on RequestModel {
  CompanyModel toCompany() {

  }
}
