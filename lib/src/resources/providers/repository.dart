import 'package:challenge_flutter/src/models/request_model.dart';
import 'package:challenge_flutter/src/resources/providers/search_api_provider.dart';

class Repository {
  final _requestApi = RequestApiProvider();

  Future<RequestModel> fetchRequestData({required String nif}) => _requestApi.getData(nif: nif);
}
