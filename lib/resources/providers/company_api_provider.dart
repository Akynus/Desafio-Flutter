import 'package:challenge_flutter/models/company.dart';
import 'package:http/http.dart' as http;

class CompanyApiProvider {
  Future<Company?> getData({required String code}) async {
    var uri = Uri.parse("https://www.receitaws.com.br/v1/cnpj/$code");
    await http.get(uri);
    return null;
  }
}
