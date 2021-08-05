import 'dart:convert';

import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/translate.dart';
import 'package:http/http.dart' as http;

class RequestApiProvider {
  Future<RequestModel> getData({required String nif}) async {
    var uri = Uri.parse("https://www.receitaws.com.br/v1/cnpj/$nif");
    var response = await http.get(uri);
    if (response.statusCode == 200) return RequestModel.fromJson(json.decode(response.body));
    throw translate(Keys.error_connection);
  }
}
